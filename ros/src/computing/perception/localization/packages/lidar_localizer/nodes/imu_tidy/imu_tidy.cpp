#include <ros/ros.h>
#include <sensor_msgs/Imu.h>
#include <autoware_config_msgs/ConfigImuTidy.h>

class ImuTidy
{
private :
	ros::NodeHandle nh_, private_nh_;

	ros::Subscriber sub_imu_raw_, sub_config_;
	ros::Publisher pub_imu_raw_tidy_;

	autoware_config_msgs::ConfigImuTidy config_;

	//double gravity_alpha_;//重力加速度を取り除くローパスフィルタの重み
	double gravityX_, gravityY_, gravityZ_;

	void callbackConfig(const autoware_config_msgs::ConfigImuTidy& msg)
	{
		config_ = msg;
	}

	void callbackImuRaw(const sensor_msgs::Imu& msg)
	{
		sensor_msgs::Imu ret;
		ret.header = msg.header;

		geometry_msgs::Vector3 imu_gra = msg.linear_acceleration; //加速度(重力加速度が含まれている)

		double gravity_alpha_ = config_.lowpass_filter_weight;//重力加速度を取り除くローパスフィルタの重み
		//重力加速度を前回との移動平均で計算
		gravityX_ = gravity_alpha_ * gravityX_ + (1.0 - gravity_alpha_) * imu_gra.x;
		gravityY_ = gravity_alpha_ * gravityY_ + (1.0 - gravity_alpha_) * imu_gra.y;
		gravityZ_ = gravity_alpha_ * gravityZ_ + (1.0 - gravity_alpha_) * imu_gra.z;

		//補正した加速度
		ret.linear_acceleration.x = imu_gra.x - gravityX_;
		ret.linear_acceleration.y = imu_gra.y - gravityY_;
		ret.linear_acceleration.z = imu_gra.z - gravityZ_;

		pub_imu_raw_tidy_.publish(ret);
	}
public:
	ImuTidy(ros::NodeHandle nh, ros::NodeHandle p_nh)
	    : nh_(nh)
	    , private_nh_(p_nh)
	    , gravityX_(0.0)
	    , gravityY_(0.0)
	    , gravityZ_(0.0)
	    //, gravity_alpha_(0.8)
	{
		std::string imu_topic;
		private_nh_.param<std::string>("imu_topic", imu_topic, "/gnss_imu");

		pub_imu_raw_tidy_ = nh_.advertise<sensor_msgs::Imu>("/imu_raw_tidy", 1);
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
