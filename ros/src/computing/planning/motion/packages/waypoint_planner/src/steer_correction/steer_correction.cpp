#include <ros/ros.h>
#include <autoware_msgs/Lane.h>
#include <geometry_msgs/PoseStamped.h>

class SteerCorrection
{
private:
	ros::NodeHandle nh_, private_nh_;

	ros::Subscriber sub_local_waypoint_, sub_current_pose_;

	autoware_msgs::Lane local_waypoints_;
	geometry_msgs::PoseStamped current_pose_;

	void callbackLocalWaypoints(const autoware_msgs::Lane& msg)
	{
		local_waypoints_ = msg;
	}

	void callbackCurrentPose(const geometry_msgs::PoseStamped& msg)
	{
		current_pose_ = msg;
	}
public:
	SteerCorrection(ros::NodeHandle nh, ros::NodeHandle p_nh)
	{
		nh_ = nh;  private_nh_ = p_nh;

		sub_local_waypoint_ = nh_.subscribe("/final_waypoints", 10, &SteerCorrection::callbackLocalWaypoints, this);
		sub_current_pose_ = nh_.subscribe("/current_pose", 10, &SteerCorrection::callbackCurrentPose, this);
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "kvaser_microbus_can_sender");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	SteerCorrection sc(nh, private_nh);

	ros::Rate loop_rate(100);
	while(ros::ok())
	{
		ros::spinOnce();
		loop_rate.sleep();
	}

	return 0;
}
