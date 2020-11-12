#include <ros/ros.h>
#include <autoware_config_msgs/ConfigShipSteering.h>
#include <autoware_msgs/VehicleCmd.h>
#include <autoware_msgs/ShipSendTwist.h>

class ShipSteering
{
private:
	ros::NodeHandle nh_, p_nh_;

	ros::Publisher pub_send_twist_;
	ros::Subscriber sub_config_, sub_vehicle_cmd_;

	autoware_config_msgs::ConfigShipSteering config_;
	void callbackConfig(const autoware_config_msgs::ConfigShipSteering &msg)
	{
		config_ = msg;
	}

	void callbackVehicleCmd(const autoware_msgs::VehicleCmd &msg)
	{
		double cmd_angle = msg.ctrl_cmd.steering_angle;
		double send_electric_current;
		if(cmd_angle < 0) //left angle
		{
			if(cmd_angle < config_.max_angle_left) //max check
				cmd_angle = config_.max_angle_left;
			if(cmd_angle < config_.max_electric_current_left) //permission check
				cmd_angle = config_.max_electric_current_left;
			double unit_electric_current = config_.max_electric_current_left / config_.max_angle_left;
			send_electric_current = unit_electric_current * cmd_angle;
		}
		else //right angle
		{
			if(cmd_angle > config_.max_angle_right) //max check
				cmd_angle = config_.max_angle_right;
			if(cmd_angle > config_.max_electric_current_right) //permission check
				cmd_angle = config_.max_electric_current_right;
			double unit_electric_current = config_.max_electric_current_right / config_.max_angle_right;
			send_electric_current = unit_electric_current * cmd_angle;
		}

		autoware_msgs::ShipSendTwist ret;
		ret.header.stamp = ros::Time::now();
		ret.steer_electric_current = send_electric_current;
		ret.velocity_electric_current = 0; //unused
		pub_send_twist_.publish(ret);
	}
public:
	ShipSteering(ros::NodeHandle nh, ros::NodeHandle p_nh)
		: nh_(nh)
		, p_nh_(p_nh)
	{
		pub_send_twist_ = nh_.advertise<autoware_msgs::ShipSendTwist>("/ship_send_twist", 10);
		sub_config_ = nh_.subscribe("/config/ship_steering", 10, &ShipSteering::callbackConfig, this);
		sub_vehicle_cmd_ = nh_.subscribe("/vehicle_cmd", 10, &ShipSteering::callbackVehicleCmd, this);

		config_.max_electric_current_left = -2.5;
		config_.max_electric_current_right = 2.5;
		config_.max_angle_left = -90;
		config_.max_angle_right = 90;
		config_.max_electric_current_left = -30;
		config_.max_electric_current_right = 30;
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "ship_steering");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	ShipSteering ship_steering(nh, private_nh);
	ros::spin();
	return 0;
}

