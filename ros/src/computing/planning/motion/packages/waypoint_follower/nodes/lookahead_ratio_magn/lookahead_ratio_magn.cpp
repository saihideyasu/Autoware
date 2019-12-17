#include <ros/ros.h>
#include <autoware_config_msgs/ConfigLookAheadRatioMagn.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <autoware_msgs/Lane.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/transform_datatypes.h>
#include <autoware_msgs/DifferenceToWaypointDistance.h>
#include <std_msgs/Float64.h>

static const int SYNC_FRAMES = 50;
typedef message_filters::sync_policies::ApproximateTime<geometry_msgs::TwistStamped, geometry_msgs::PoseStamped>
    TwistPoseSync;

class LookaheadRatioMagn
{
private:
	const double timeout = 0.5;

	ros::NodeHandle nh_, private_nh_;

	ros::Subscriber sub_config_, sub_waypoints_;
	ros::Publisher pub_difference_to_waypoint_distance_, pub_lookahead_ratio_magn_;

	message_filters::Subscriber<geometry_msgs::TwistStamped> *sub_current_velocity_;
	message_filters::Subscriber<geometry_msgs::PoseStamped> *sub_current_pose_;
	message_filters::Synchronizer<TwistPoseSync> *sync_twist_pose_;

	autoware_config_msgs::ConfigLookAheadRatioMagn config_;

	geometry_msgs::Pose waypose1_, waypose2_;
	geometry_msgs::TwistStamped current_twist_;
	geometry_msgs::PoseStamped current_pose_;

	void callbackConfig(const autoware_config_msgs::ConfigLookAheadRatioMagn &msg)
	{
		config_ = msg;
	}

	void callbackWaypoints(const autoware_msgs::Lane &msg)
	{
		if(msg.waypoints.size() < 3) return;

		waypose1_ = msg.waypoints[1].pose.pose;
		waypose2_ = msg.waypoints[2].pose.pose;
	}

	void TwistPoseCallback(const geometry_msgs::TwistStampedConstPtr &twist_msg,
	                       const geometry_msgs::PoseStampedConstPtr &pose_msg)
	{
		current_twist_ = *twist_msg;
		current_pose_ = *pose_msg;
	}
public:
	LookaheadRatioMagn(ros::NodeHandle nh, ros::NodeHandle p_nh)
		: nh_(nh)
		, private_nh_(p_nh)
	{
		pub_difference_to_waypoint_distance_ = nh_.advertise<autoware_msgs::DifferenceToWaypointDistance>("/difference_to_waypoint_distance", 1);
		pub_lookahead_ratio_magn_ = nh_.advertise<std_msgs::Float64>("/lookahead_ratio_magn", 1);
		sub_config_= nh_.subscribe("/config/lookahead_ratio_magn", 1, &LookaheadRatioMagn::callbackConfig, this);
		sub_waypoints_= nh_.subscribe("/final_waypoints", 1, &LookaheadRatioMagn::callbackWaypoints, this);
		sub_current_pose_ = new message_filters::Subscriber<geometry_msgs::PoseStamped>(nh_, "/current_pose", 10);
		sub_current_velocity_ = new message_filters::Subscriber<geometry_msgs::TwistStamped>(nh_, "/current_velocity", 10);
		sync_twist_pose_ = new message_filters::Synchronizer<TwistPoseSync>(TwistPoseSync(SYNC_FRAMES), *sub_current_velocity_, *sub_current_pose_);
		sync_twist_pose_->registerCallback(boost::bind(&LookaheadRatioMagn::TwistPoseCallback, this, _1, _2));
	}
	
	void run()
	{
		///////////////////////////////

		double x1 = waypose1_.position.x, x2 = waypose2_.position.x;
		double y1 = waypose1_.position.y, y2 = waypose2_.position.y;
		double a = y2 - y1;
		double b = x1 - x2;
		double c = - x1 * y2 + y1 * x2;

		double x0 = current_pose_.pose.position.x, y0 = current_pose_.pose.position.y;
		double db = sqrt(a * a + b * b);
		if(db == 0)
		{
			return;
		}
		double d = (a * x0 + b * y0 + c) / db;
		//std::cout << "distance : " << d << std::endl;

		tf::Quaternion current_q(current_pose_.pose.orientation.x, current_pose_.pose.orientation.y, current_pose_.pose.orientation.z,
			current_pose_.pose.orientation.w);
		tf::Matrix3x3 current_m(current_q);
		double current_yaw, current_roll, current_pitch;
		current_m.getRPY(current_roll, current_pitch, current_yaw);

		tf::Quaternion way_q(waypose1_.orientation.x, waypose1_.orientation.y, waypose1_.orientation.z,
			waypose1_.orientation.w);
		tf::Matrix3x3 way_m(way_q);
		double way_yaw, way_roll, way_pitch;
		way_m.getRPY(way_roll, way_pitch, way_yaw);

		tf::Quaternion sa_q = way_q * current_q.inverse();
		tf::Matrix3x3 sa_m(sa_q);
		double sa_yaw, sa_roll, sa_pitch;
		sa_m.getRPY(sa_roll, sa_pitch, sa_yaw);
		std::cout << "yaw : " << current_yaw * 180 / M_PI << "," << way_yaw * 180 / M_PI<< "," << sa_yaw * 180 / M_PI<< std::endl;

		autoware_msgs::DifferenceToWaypointDistance dist;
		dist.header.stamp = ros::Time::now();
		dist.distance = d;
		dist.angular = sa_yaw;
		pub_difference_to_waypoint_distance_.publish(dist);

		//////////////////////////////////////

		double magn = 1.0;
		if(fabs(d) > config_.max_distance)
		{
			magn = config_.min_magn;
		}
		else if(fabs(d) <=config_.max_distance && fabs(d) >=config_.min_distance)
		{
			double distance_length = config_.max_distance - config_.min_distance;
			double size1 = (d - config_.min_magn) / distance_length;
			double magn_length = config_.max_magn -config_.min_magn;
			magn = size1 * magn_length + config_.min_magn;
		}
		else
		{
			magn = config_.max_magn;
		}

		std_msgs::Float64 magn_msg;
		magn_msg.data = magn;
		pub_lookahead_ratio_magn_.publish(magn_msg);
	}
};

int main(int argc, char** argv)
{
	ros::init(argc, argv, "lookahead_ratio_magn");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

	LookaheadRatioMagn lhm(nh, private_nh);

	ros::Rate loop_rate(100);
	while(ros::ok())
	{
		ros::spinOnce();
		lhm.run();
		loop_rate.sleep();
	}
	return 0;
}
