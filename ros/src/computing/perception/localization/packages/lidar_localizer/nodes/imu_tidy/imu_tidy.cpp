#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Imu.h>
#include <autoware_msgs/ImuMathValue.h>
#include <autoware_config_msgs/ConfigImuTidy.h>
#include "Kalman.h"

class ImuTidy
{
private :
	const double RAD_TO_DEG_ = 180.0 / M_PI;
	ros::NodeHandle nh_, private_nh_;

	ros::Subscriber sub_imu_raw_, sub_config_;
	ros::Publisher pub_imu_raw_tidy_, pub_string_;

	autoware_config_msgs::ConfigImuTidy config_;

	//double gravity_alpha_;//重力加速度を取り除くローパスフィルタの重み
	double gravityX_, gravityY_, gravityZ_;
	double accelerationX_, accelerationY_, accelerationZ_;
	double velX_, velY_, velZ_;
	double gyroXangle_, gyroYangle_; // Angle calculate using the gyro only
	double compAngleX_, compAngleY_; // Calculated angle using a complementary filter
	double kalAngleX_, kalAngleY_;
	Kalman kalmanX_, kalmanY_;

	sensor_msgs::Imu imu_;

	void callbackConfig(const autoware_config_msgs::ConfigImuTidy& msg)
	{
		config_ = msg;
	}

        bool first_read_flag;
	void callbackImuRaw(const sensor_msgs::Imu& msg)
	{
		geometry_msgs::Vector3 imu_gra = msg.linear_acceleration; //加速度(重力加速度が含まれている)

		double gravity_alpha_ = config_.lowpass_filter_weight;//重力加速度を取り除くローパスフィルタの重み

		double accX = msg.linear_acceleration.x;
		double accY = msg.linear_acceleration.y;
		double accZ = msg.linear_acceleration.z;
		double gyroX = msg.angular_velocity.x;
		double gyroY = msg.angular_velocity.y;
		double gyroZ = msg.angular_velocity.z;

		double roll  = atan2(accY, accZ) * RAD_TO_DEG_;
		double pitch = atan(-accX / sqrt(accY * accY + accZ * accZ)) * RAD_TO_DEG_;

		//重力加速度を前回との移動平均で計算
		gravityX_ = gravity_alpha_ * gravityX_ + (1.0 - gravity_alpha_) * imu_gra.x;
		gravityY_ = gravity_alpha_ * gravityY_ + (1.0 - gravity_alpha_) * imu_gra.y;
		gravityZ_ = gravity_alpha_ * gravityZ_ + (1.0 - gravity_alpha_) * imu_gra.z;

		//補正した加速度
		double comAccX = imu_gra.x - gravityX_;
		double comAccY = imu_gra.y - gravityY_;
		double comAccZ = imu_gra.z - gravityZ_;

		//if(fabs(comAccX) < 100)comAccX = 0;
		//if(fabs(comAccY) < 100)comAccY = 0;
		//if(fabs(comAccZ) < 100)comAccZ = 0;

		ros::Duration rostime = msg.header.stamp - imu_.header.stamp;
		double dt = rostime.sec + rostime.nsec * 1E-9;

		double jurkX = (comAccX - accelerationX_) / dt;
		double jurkY = (comAccY - accelerationY_) / dt;
		double jurkZ = (comAccZ - accelerationZ_) / dt;

		if(first_read_flag == false)
		{
			kalmanX_.setAngle(roll); // Set starting angle
			kalmanY_.setAngle(pitch);
			gyroXangle_ = roll;
			gyroYangle_ = pitch;
			compAngleX_ = roll;
			compAngleY_ = pitch;

			first_read_flag = true;
		}
		else
		{
			double gyroXrate = gyroX / 131.0; // Convert to deg/s
			double gyroYrate = gyroY / 131.0; // Convert to deg/s
			
			if ((roll < -90 && kalAngleX_ > 90) || (roll > 90 && kalAngleX_ < -90))
			{
    			kalmanX_.setAngle(roll);
    			compAngleX_ = roll;
    			kalAngleX_ = roll;
    			gyroXangle_ = roll;
  			}
			else
			{
				kalAngleX_ = kalmanX_.getAngle(roll, gyroXrate, dt); // Calculate the angle using a Kalman filter
			}

			if (abs(kalAngleX_) > 90) gyroYrate = -gyroYrate; // Invert rate, so it fits the restriced accelerometer reading
  			kalAngleY_ = kalmanY_.getAngle(pitch, gyroYrate, dt);

			gyroXangle_ += gyroXrate * dt; // Calculate gyro angle without any filter
  			gyroYangle_ += gyroYrate * dt;
			//  gyroXangle += kalmanX.getRate() * dt; // Calculate gyro angle using the unbiased rate
			//  gyroYangle += kalmanY.getRate() * dt;

			compAngleX_ = 0.93 * (compAngleX_ + gyroXrate * dt) + 0.07 * roll; // Calculate the angle using a Complimentary filter
  			compAngleY_ = 0.93 * (compAngleY_ + gyroYrate * dt) + 0.07 * pitch;

			if (gyroXangle_ < -180 || gyroXangle_ > 180)
    			gyroXangle_ = kalAngleX_;
			if (gyroYangle_ < -180 || gyroYangle_ > 180)
   				gyroYangle_ = kalAngleY_;

			velX_ = velX_ + comAccX*dt;
			velY_ = velY_ + comAccY*dt;
			velZ_ = velZ_ + comAccZ*dt;

			autoware_msgs::ImuMathValue imv;
			imv.header = msg.header;
			imv.velocity.x = velX_;
			imv.velocity.y = velY_;
			imv.velocity.z = velZ_;
			imv.acceleration.x = comAccX;
			imv.acceleration.y = comAccY;
			imv.acceleration.z = comAccZ;
			imv.jurk.x = jurkX;
			imv.jurk.y = jurkY;
			imv.jurk.z = jurkZ;
			imv.angular_velocity.x = msg.angular_velocity.x;
			imv.angular_velocity.y = msg.angular_velocity.y;
			imv.angular_velocity.z = msg.angular_velocity.z;
			pub_imu_raw_tidy_.publish(imv);

			std::stringstream str;
			str << std::setprecision(16)<< "velocity," << imv.velocity.x << "," << imv.velocity.y << "," << imv.velocity.z << std::endl;
			str << std::setprecision(16)<< "acceleration," << imv.acceleration.x << "," << imv.acceleration.y << "," << imv.acceleration.z << std::endl;
			str << std::setprecision(16)<< "jurk," << imv.jurk.x << "," << imv.jurk.y << "," << imv.jurk.z << std::endl;
			pub_string_.publish(str.str());
		}

		accelerationX_ = comAccX;
		accelerationY_ = comAccY;
		accelerationZ_ = comAccZ;
		imu_ = msg;
            //pub_imu_raw_tidy_.publish(ret);
	}
public:
	ImuTidy(ros::NodeHandle nh, ros::NodeHandle p_nh)
	    : nh_(nh)
	    , private_nh_(p_nh)
	    , gravityX_(0.0)
	    , gravityY_(0.0)
	    , gravityZ_(0.0)
        , first_read_flag(false)
		, kalAngleX_(0.0)
		, kalAngleY_(0.0)
		, velX_(0.0)
		, velY_(0.0)
		, velZ_(0.0)
	    //, gravity_alpha_(0.8)
	{
		std::string imu_topic;
		private_nh_.param<std::string>("imu_topic", imu_topic, "/gnss_imu");

        pub_imu_raw_tidy_ = nh_.advertise<autoware_msgs::ImuMathValue>("/imu_math_value", 1);
		pub_string_ = nh_.advertise<std_msgs::String>("/imu_math_value_string", 1);
		sub_imu_raw_ = nh_.subscribe(imu_topic, 1, &ImuTidy::callbackImuRaw, this);
		sub_config_ = nh_.subscribe("/config/imu_tidy", 1, &ImuTidy::callbackConfig, this);
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "imu_tidy");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	ImuTidy imu_tidy(nh, private_nh);

	ros::Rate loop_rate(100);
	while(ros::ok())
	{
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}
