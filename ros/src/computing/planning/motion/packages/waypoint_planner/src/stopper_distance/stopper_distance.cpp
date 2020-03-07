#include <ros/ros.h>
#include <autoware_msgs/Lane.h>
#include <std_msgs/Float64.h>
#include <std_msgs/Int32.h>
#include <autoware_msgs/TrafficLight.h>
#include <tf/transform_broadcaster.h>

class StopperDistance
{
private:
	ros::NodeHandle nh_, private_nh_;
	ros::Subscriber sub_waypoint_, sub_light_color_, sub_camera_light_color_, sub_temporari_flag_;
	ros::Subscriber sub_obstacle_waypoint_;
	ros::Publisher pub_stopline_distance_;

	double const front_bumper_to_baselink = 6.25 - 1.7;

	int light_color_ = 1;
	void callbackCameraLightColor(const autoware_msgs::TrafficLight& msg)
	{
		light_color_ = msg.traffic_light;
		std::cout << light_color_ << std::endl;
	}
	void callbackLightColor(const autoware_msgs::TrafficLight& msg)
	{
		light_color_ = msg.traffic_light;
		std::cout << light_color_ << std::endl;
	}

	int temporary_flag_ = 0;
	void callbackTemporaryFlag(const std_msgs::Int32& msg)
	{
		temporary_flag_ = msg.data;
	}

	int obstacle_waypoint_ = -1;
	const int obstacle_offset_ = 2;
	void callbackObstacleWaypoint(const std_msgs::Int32& msg)
	{
		obstacle_waypoint_ = msg.data;
	}

	void waypointCallback(const autoware_msgs::Lane& msg)
	{
		double dis = 0;
		for(int i=1; i<msg.waypoints.size(); i++)
		{
			tf::Vector3 v1(msg.waypoints[i-1].pose.pose.position.x,
			               msg.waypoints[i-1].pose.pose.position.y, 0);

			tf::Vector3 v2(msg.waypoints[i].pose.pose.position.x,
			               msg.waypoints[i].pose.pose.position.y, 0);

			dis += tf::tfDistance(v1, v2);

			autoware_msgs::WaypointParam waypoint_param = msg.waypoints[i].waypoint_param;
			if(waypoint_param.signal_stop_line > 0 && light_color_ == 0)
			{
				std_msgs::Float64 pubmsg;
				pubmsg.data = dis - front_bumper_to_baselink;
				if(pubmsg.data < 0) pubmsg.data = 0;
				pub_stopline_distance_.publish(pubmsg);
				return;
			}
			else if(waypoint_param.temporary_stop_line > 0 && temporary_flag_ == 1)
			{
				std_msgs::Float64 pubmsg;
				pubmsg.data = dis - front_bumper_to_baselink;
				if(pubmsg.data < 0) pubmsg.data = 0;
				pub_stopline_distance_.publish(pubmsg);
				return;
			}
			else if(obstacle_waypoint_ > 0 && obstacle_waypoint_ == i)
			{
				std_msgs::Float64 pubmsg;
				pubmsg.data = dis - (front_bumper_to_baselink + obstacle_offset_);
				if(pubmsg.data < 0) pubmsg.data = 0;
				pub_stopline_distance_.publish(pubmsg);
				return;
			}
		}

		std_msgs::Float64 pubmsg;
		pubmsg.data = -1;
		pub_stopline_distance_.publish(pubmsg);
	}
public:
	StopperDistance(ros::NodeHandle nh, ros::NodeHandle p_nh)
	{
		nh_ = nh;  private_nh_ = p_nh;

		pub_stopline_distance_ = nh_.advertise<std_msgs::Float64>("/stopper_distance", 1);
		sub_waypoint_ = nh_.subscribe("/final_waypoints", 1, &StopperDistance::waypointCallback, this);
		sub_light_color_ = nh_.subscribe("/light_color", 1, &StopperDistance::callbackLightColor, this);
		sub_camera_light_color_ = nh_.subscribe("/camera_light_color", 1, &StopperDistance::callbackCameraLightColor, this);
		sub_temporari_flag_ = nh_.subscribe("/temporary_flag", 1, &StopperDistance::callbackTemporaryFlag, this);
		sub_obstacle_waypoint_ = nh_.subscribe("/obstacle_waypoint", 1, &StopperDistance::callbackObstacleWaypoint, this);
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "stopper_distance");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	StopperDistance sd(nh, private_nh);
	ros::Rate rate(100);
	while(ros::ok())
	{
		ros::spinOnce();
		rate.sleep();
	}

	return 0;
}
