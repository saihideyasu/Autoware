#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float64.h>
#include <autoware_msgs/Lane.h>
#include <autoware_config_msgs/ConfigTemporaryStopper.h>
#include <geometry_msgs/TwistStamped.h>
#include <autoware_can_msgs/MicroBusCan502.h>
#include <visualization_msgs/MarkerArray.h>

class TemporaryStopper
{
private:
	ros::NodeHandle nh_, private_nh_;
	ros::Subscriber sub_waypoint_, sub_can_, sub_current_velocity_, sub_distance_, sub_config_;
	ros::Publisher pub_waypoint_, pub_temporary_line_, pub_temporary_distance_, pub_temporari_flag_;

	autoware_config_msgs::ConfigTemporaryStopper config_;
	autoware_can_msgs::MicroBusCan502 can_;
	geometry_msgs::TwistStamped current_velocity_;

	double front_bumper_to_baselink_;
	uint32_t stop_waypoint_id_;
	ros::Time timer_;
	double stop_time_, distance_;

	autoware_msgs::Lane apply_acceleration(const autoware_msgs::Lane& lane, double acceleration, int start_index,
	                                       size_t fixed_cnt, double fixed_vel)
	{
	  autoware_msgs::Lane l = lane;

	  if (fixed_cnt == 0)
		return l;

	  double square_vel = fixed_vel * fixed_vel;
	  double distance = 0;
	  for (int i = start_index; i < l.waypoints.size(); ++i)
	  {
		if (i - start_index < fixed_cnt)
		{
			l.waypoints[i].twist.twist.linear.x = fixed_vel;
			continue;
		}

		geometry_msgs::Point a = l.waypoints[i - 1].pose.pose.position;
		geometry_msgs::Point b = l.waypoints[i].pose.pose.position;
		distance += hypot(b.x - a.x, b.y - a.y);

		double v = sqrt(square_vel + 2 * acceleration * distance);
		if (v < l.waypoints[i].twist.twist.linear.x)
			l.waypoints[i].twist.twist.linear.x = v;
		else
			break;
	  }

	  return l;
	}

	int stop_line_search(const autoware_msgs::Lane& way)
	{
		std_msgs::Int32 dis;
		dis.data = -1;

		if(way.waypoints.size() == 0 || way.waypoints[0].waypoint_param.id < 5)
		{
			pub_temporary_distance_.publish(dis);
			return -1;
		}

		for(int i=0; i<way.waypoints.size() || i<config_.search_distance; i++)
		{
			//std::cout << "i," << (int)way.waypoints[i].waypoint_param.temporary_stop_line << std::endl;
			if(way.waypoints[i].waypoint_param.temporary_stop_line > 2)
			{
				stop_time_ = way.waypoints[i].waypoint_param.temporary_stop_line;

				visualization_msgs::Marker marker;
				marker.header.frame_id = "/map";
				marker.ns = "Temporary Line";
				marker.id = 0;
				marker.type = 1;
				marker.action = 0;
				marker.pose = way.waypoints[i].pose.pose;
				marker.pose.position.z += 1;
				marker.scale.x = 0.1;
				marker.scale.y = 15;
				marker.scale.z = 2;
				marker.color.r = 0;
				marker.color.g = 0;
				marker.color.b = 1;
				marker.color.a = 0.3;
				marker.frame_locked = true;
				marker.mesh_use_embedded_materials = false;
				visualization_msgs::MarkerArray array;
				array.markers.push_back(marker);
				pub_temporary_line_.publish(array);

				std_msgs::Int32 dis;
				dis.data = i;
				pub_temporary_distance_.publish(dis);

				return i;
			}
		}

		pub_temporary_distance_.publish(dis);
		return -1;
	}

	autoware_msgs::Lane apply_stopline_acceleration(const autoware_msgs::Lane& lane, double acceleration,
	                                                int ahead_cnt, int behind_cnt)
	{
		std_msgs::Int32 flag;

		int stop_index = stop_line_search(lane); std::cout << stop_index << std::endl;
		if(stop_index < 0)
		{
			stop_waypoint_id_ = 0;
			flag.data = 0;//そのまま
			pub_temporari_flag_.publish(flag);
			return lane;
		}

		ros::Time now_time = ros::Time::now();
		if(timer_ < now_time)
		{
			if(stop_waypoint_id_ == lane.waypoints[stop_index].waypoint_param.id)
			{
				flag.data = 2;
				pub_temporari_flag_.publish(flag);
				return lane;//停止判定終了
			}
			else
			{
				stop_waypoint_id_ = 0;
				//if(can_.velocity_actual <= config_.stop_speed_threshold)
				if(current_velocity_.twist.linear.x <= config_.stop_speed_threshold
				        && distance_ <= 2.5)
				{
					stop_waypoint_id_ = lane.waypoints[stop_index].waypoint_param.id;
					timer_ = ros::Time(now_time.sec + (int)stop_time_, now_time.nsec);
					std::cout << "time : " << timer_.sec << "," << now_time.sec << std::endl;
				}
				flag.data = 1;//停止判定あり
				pub_temporari_flag_.publish(flag);
			}
		}

		autoware_msgs::Lane l = apply_acceleration(lane, acceleration, stop_index, behind_cnt + 1, 0);
		std::reverse(l.waypoints.begin(), l.waypoints.end());
		int reverse_stop_index = l.waypoints.size() - stop_index - 1;
		l = apply_acceleration(l, acceleration, reverse_stop_index, ahead_cnt + 1, 0);
		std::reverse(l.waypoints.begin(), l.waypoints.end());

		if(distance_ >= 0)
		{
			if(distance_ <= 1) l.waypoints[0].twist.twist.linear.x = 0;
			else if(distance_ <= 20.0)
			{
				for(int i=0; i<stop_index-1; i++)
				{
					int ind = i + (int)front_bumper_to_baselink_;
					if(ind >= l.waypoints.size()) break;
					l.waypoints[i].twist.twist.linear.x = l.waypoints[ind].twist.twist.linear.x;
				}
			}
		}
		return l;
	}

	void callbackCan(const autoware_can_msgs::MicroBusCan502& msg)
	{
		can_ = msg;
	}

	void callbackDistance(const std_msgs::Float64& msg)
	{
		distance_ = msg.data;
	}

	void callbackCurrentVelocity(const geometry_msgs::TwistStamped& msg)
	{
		current_velocity_ = msg;
	}

	void callbackConfig(const autoware_config_msgs::ConfigTemporaryStopper& msg)
	{
		config_ = msg;
	}

	void callbackWaypoint(const autoware_msgs::Lane& msg)
	{
		autoware_msgs::Lane lane = apply_stopline_acceleration(msg, config_.acceleration,
		                            config_.number_of_zeros_ahead, config_.number_of_zeros_behind);
		pub_waypoint_.publish(lane);
	}
public:
	TemporaryStopper(ros::NodeHandle nh, ros::NodeHandle p_nh)
	    : stop_waypoint_id_(0)
	    , stop_time_(5.0)
	    , distance_(0.0)
	{
		nh_ = nh;  private_nh_ = p_nh;

		/*config_.search_distance = 7;
		config_.acceleration = 1;
		config_.number_of_zeros_ahead = 0;
		config_.number_of_zeros_behind = 5;
		config_.stop_speed_threshold = 0.018;*/

		timer_ = ros::Time::now();
		can_.velocity_actual = 0;

		nh_.param<double>("/vehicle_info/front_bumper_to_baselink", front_bumper_to_baselink_, 4.55);
		pub_waypoint_ = nh_.advertise<autoware_msgs::Lane>("/temporary_stop_waypoints", 1);
		pub_temporary_line_ = nh_.advertise<visualization_msgs::MarkerArray>("/temporary_line", 1);
		pub_temporary_distance_ = nh_.advertise<std_msgs::Int32>("/temporary_distance", 1);
		pub_temporari_flag_ = nh_.advertise<std_msgs::Int32>("/temporary_flag", 1);
		sub_waypoint_ = nh_.subscribe("/safety_waypoints", 1, &TemporaryStopper::callbackWaypoint, this);
		sub_can_ = nh_.subscribe("/microbus/can_receive502", 1, &TemporaryStopper::callbackCan, this);
		sub_current_velocity_ = nh_.subscribe("/current_velocity", 1, &TemporaryStopper::callbackCurrentVelocity, this);
		sub_distance_ = nh_.subscribe("/stopper_distance", 1, &TemporaryStopper::callbackDistance, this);
		sub_config_ = nh_.subscribe("/config/stopper_distance", 1, &TemporaryStopper::callbackConfig, this);
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "temporary_stopper");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	TemporaryStopper ts(nh, private_nh);
	ros::Rate rate(100);
	while(ros::ok())
	{
		ros::spinOnce();
		rate.sleep();
	}

	return 0;
}
