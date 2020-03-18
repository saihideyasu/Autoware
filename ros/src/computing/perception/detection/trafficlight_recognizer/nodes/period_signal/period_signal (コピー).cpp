#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <autoware_system_msgs/Date.h>
#include <std_msgs/String.h>
#include <autoware_msgs/Lane.h>
#include <autoware_msgs/TrafficLight.h>
#include <autoware_config_msgs/ConfigPeriodSignal.h>
#include "TrafficLight.h"
#include <unistd.h>

struct TimeStep
{
    double time_step_green_, time_step_yellow_, time_step_red_;
};

class PeriodSignal
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Subscriber sub_config_, sub_local_waypoints_, sub_gnss_time_;
    ros::Publisher pub_signal_stat_, pub_signal_stat_string_, pub_signal_change_time_, pub_signal_red_change_time_;
    ros::Publisher pub_signal_stopline_reach_time_, pub_signal_takeover_acc_;

    autoware_config_msgs::ConfigPeriodSignal config_;

    double first_time_;
    autoware_system_msgs::Date gnss_time_;
    TimeStep time_step_;
    int prev_traffic_;
    double delta_t_sum_;

    // traffic_light_takeover
    double red_change_time_;
    double takeover_acc_;
    bool takeover_flag_;

    void callbackConfig(const autoware_config_msgs::ConfigPeriodSignal &msg)
    {
        config_ = msg;
        first_time_ = config_.first_hour*60.0*60.0 + config_.first_min*60.0 + config_.first_sec;
        time_step_.time_step_green_ = config_.step_green;
        time_step_.time_step_yellow_ = config_.step_yellow;
        time_step_.time_step_red_ = config_.step_red;
    }

    std::vector<std::string> split(const std::string &string, const char sep)
    {
        std::vector<std::string> str_vec_ptr;
        std::string token;
        std::stringstream ss(string);

        while (getline(ss, token, sep))
            str_vec_ptr.push_back(token);

        return str_vec_ptr;
    }

    bool signalTimerCheck()
    {
        std::cout << "config : " << first_time_ << "," << time_step_.time_step_green_ << "," << time_step_.time_step_yellow_ << "," << time_step_.time_step_red_ << std::endl;
        if((first_time_ >= 0) && (time_step_.time_step_green_ > 0) && (time_step_.time_step_yellow_ > 0) && (time_step_.time_step_red_ > 0))
            return true;
        else return false;
    }

    void callbackLocalWaypoints(const autoware_msgs::Lane &lane)
    {
        double takeover_index = -1;
        double stopper_distance_at_red = 0;
        delta_t_sum_ = 0;
        double distance_sum = 0;

        geometry_msgs::Point pose_prev;
        for(int num=1; num<lane.waypoints.size(); num++)
        {
            std::string time_first_str = lane.waypoints[num].waypoint_param.period_signal_time_first;
            std::vector<std::string> time_first_vec = split(time_first_str, ':');
            //std::cout << lane.waypoints[num].waypoint_param.id << std::endl;
            std::cout << "vec_size : " << time_first_vec.size() << std::endl;
            if(time_first_vec.size() == 3)
            {
                unsigned int hour, min, sec;
                try
                {
                    hour = std::stoi(time_first_vec[0]);
                    min = std::stoi(time_first_vec[1]);
                    sec = std::stoi(time_first_vec[2]);

                    //if(hour != 0 || min != 0 || sec == 0)
                    {
                        std::cout << "signalTimerCheck : " << (int)signalTimerCheck() << std::endl;
                        if(takeover_index >= 0 && signalTimerCheck())
                        {
                            std::cout << "distance : " << stopper_distance_at_red << std::endl;
                            if(stopper_distance_at_red > 0)
                            {
                                double takeover_velocity = lane.waypoints[takeover_index].twist.twist.linear.x;
                                takeover_acc_ = takeover_velocity * takeover_velocity / (2 * stopper_distance_at_red);
                                std::cout <<"stopper_distance_at_red:"<<stopper_distance_at_red
                                            <<"takeover_index:"<< takeover_index 
                                            << ",takeover_velocity:" << takeover_velocity 
                                            << ",takeover_acc_:" << takeover_acc_ << std::endl;
                            }
                            else if(stopper_distance_at_red == 0) takeover_acc_ = DBL_MAX;
                        }
                        else takeover_acc_ = 0;

                        first_time_ = hour*60.0*60.0 + min*60.0 + sec;
                        time_step_.time_step_green_ = lane.waypoints[num].waypoint_param.period_signal_time_step_green;
                        time_step_.time_step_yellow_ = lane.waypoints[num].waypoint_param.period_signal_time_step_yellow;
                        time_step_.time_step_red_ = lane.waypoints[num].waypoint_param.period_signal_time_step_red;
                        std::cout << first_time_ << "," << time_step_.time_step_green_ << "," << time_step_.time_step_yellow_ << "," << time_step_.time_step_red_ << std::endl;

                        return;
                    }
                }
                catch (const std::invalid_argument& e)
                {
                    std::cout << "[" << num << "]: " << "invalid argument" << std::endl;
                }
                catch (const std::out_of_range& e)
                {
                    std::cout << "[" << num << "]: " << "out of range" << std::endl;
                }
            }
            else first_time_ = -1;

            geometry_msgs::Point pose = lane.waypoints[num].pose.pose.position;
            if(num > 1)
            {
                double distance = hypot(pose.x - pose_prev.x, pose.y - pose_prev.y);
                //takeover
                if(signalTimerCheck())
                {
                    double delta_t = distance / lane.waypoints[num-1].twist.twist.linear.x;
                    delta_t_sum_ += delta_t;
                    if(red_change_time_ < delta_t_sum_)
                    {
                        // traffic_light_takeover
                        if(takeover_index == -1) takeover_index = num;//lane.waypoints[num].waypoint_param.id;
                        else stopper_distance_at_red += distance;
                    }
                    //std::cout << "stopper_distance_at_red:" << stopper_distance_at_red << std::endl;
                    std::cout << "red_change_time_:" << red_change_time_ << "  delta_t_sum_:" << delta_t_sum_ << std::endl;
                }

                //end jouken
                distance_sum += distance;
                if(distance_sum >= config_.search_distance) break;
            }
            pose_prev = pose;

            std_msgs::Float64 stop_time_msg;
            stop_time_msg.data = delta_t_sum_;
            pub_signal_stopline_reach_time_.publish(stop_time_msg);
        }

        //first_time_ = time_step_.time_step_green_ = time_step_.time_step_yellow_ = time_step_.time_step_red_ = 0;
        //takeover_acc_ = 0;
    }

    void callbackGnssTimesOfDay(const autoware_system_msgs::Date &msg)
    {
        gnss_time_ = msg;
    }
public:
    PeriodSignal(ros::NodeHandle nh, ros::NodeHandle p_nh)
        : nh_(nh)
        , private_nh_(p_nh)
        , first_time_(-1)
        , prev_traffic_(TRAFFIC_LIGHT_UNKNOWN)
        , red_change_time_(0)
        , takeover_acc_(0)
        , takeover_flag_(false)
    {
        time_step_.time_step_green_ = time_step_.time_step_yellow_ = time_step_.time_step_red_ = 0;

        sub_config_ = nh_.subscribe("/config/period_signal", 1, &PeriodSignal::callbackConfig, this);
        sub_local_waypoints_ = nh_.subscribe("/final_waypoints", 1, &PeriodSignal::callbackLocalWaypoints, this);
        sub_gnss_time_ = nh_.subscribe("/gnss_time", 1, &PeriodSignal::callbackGnssTimesOfDay, this);

        pub_signal_stat_ = nh_.advertise<autoware_msgs::TrafficLight>("/light_color", 10, true);
        pub_signal_stat_string_ = nh_.advertise<std_msgs::String>("/sound_player", 10);
        pub_signal_change_time_ = nh_.advertise<std_msgs::Float64>("/signal_change_time", 10);
        pub_signal_red_change_time_ = nh_.advertise<std_msgs::Float64>("/signal_red_change_time", 10);
        pub_signal_stopline_reach_time_ = nh_.advertise<std_msgs::Float64>("/signal_stopline_reach_time", 10);
        pub_signal_takeover_acc_ = nh_.advertise<std_msgs::Float64>("/signal_takeover_acc", 10);

        autoware_msgs::TrafficLight traffic_light_msg;
        std_msgs::String state_string_msg;
        traffic_light_msg.traffic_light = TRAFFIC_LIGHT_GREEN;
        state_string_msg.data = TLR_GREEN_SIGNAL_STR;
        prev_traffic_ = TRAFFIC_LIGHT_GREEN;
        pub_signal_stat_.publish(traffic_light_msg);
        pub_signal_stat_string_.publish(state_string_msg);
    }

    void run()
    {
        std::cout << "flag : " << (int)takeover_flag_ << "," << takeover_acc_ << std::endl;
        std_msgs::Float64 takeover_msg;
        takeover_msg.data = takeover_acc_;
        pub_signal_takeover_acc_.publish(takeover_msg);

        autoware_msgs::TrafficLight traffic_light_msg;
        std_msgs::String state_string_msg;

        if(!signalTimerCheck())
        {
            if(prev_traffic_ != TRAFFIC_LIGHT_UNKNOWN)
            {
                traffic_light_msg.traffic_light = TRAFFIC_LIGHT_UNKNOWN;
			    state_string_msg.data = TLR_UNKNOWN_SIGNAL_STR;
                pub_signal_stat_.publish(traffic_light_msg);
		        pub_signal_stat_string_.publish(state_string_msg);
                prev_traffic_ = TRAFFIC_LIGHT_UNKNOWN;

                std_msgs::Float64 change_time_msg;
                change_time_msg.data = -1;
                pub_signal_change_time_.publish(change_time_msg);
                std_msgs::Float64 red_time_msg;
                red_time_msg.data = -1;
                pub_signal_red_change_time_.publish(red_time_msg);
            }
            return;
        }

        double time_sa;
        double real_time = gnss_time_.hour*60.0*60.0 + gnss_time_.min*60.0 + gnss_time_.sec;
        if(config_.use_time_flag == 0) time_sa = real_time - first_time_;
        else
        {
            //ros::Time rostime = ros::Time::now();
            //rostime.
        }
        
        double step_all = time_step_.time_step_green_ + time_step_.time_step_yellow_ + time_step_.time_step_red_;
        double time_range = time_sa - std::floor(time_sa / step_all) * step_all;

        //green
        if(time_range < time_step_.time_step_green_)
        {
            if(time_range > 5.0 && (takeover_acc_ < config_.takeover_acc || takeover_flag_ == true))
            {
                if(prev_traffic_ != TRAFFIC_LIGHT_RED)
                {
				    traffic_light_msg.traffic_light = TRAFFIC_LIGHT_RED;
				    state_string_msg.data = TLR_RED_SIGNAL_STR;
                    prev_traffic_ = TRAFFIC_LIGHT_RED;
                    pub_signal_stat_.publish(traffic_light_msg);
		            pub_signal_stat_string_.publish(state_string_msg);
                }
                takeover_flag_ = true; std::cout << "aaa" << std::endl;
            }
            else
            {
                if(prev_traffic_ != TRAFFIC_LIGHT_GREEN)
                {
                    traffic_light_msg.traffic_light = TRAFFIC_LIGHT_GREEN;
                    state_string_msg.data = TLR_GREEN_SIGNAL_STR;
                    prev_traffic_ = TRAFFIC_LIGHT_GREEN;
                    pub_signal_stat_.publish(traffic_light_msg);
                    pub_signal_stat_string_.publish(state_string_msg);
                }
                takeover_flag_ = false; std::cout << "bbb" << std::endl;
            }

            std_msgs::Float64 change_time_msg;
            change_time_msg.data = time_step_.time_step_green_ - time_range;
            pub_signal_change_time_.publish(change_time_msg);
            red_change_time_ = time_step_.time_step_green_ - time_range;
            std_msgs::Float64 red_time_msg;
            red_time_msg.data = red_change_time_;
            pub_signal_red_change_time_.publish(red_time_msg);
        }
        //yellow
        else
        {
            time_range -= time_step_.time_step_green_;
            if(time_range < time_step_.time_step_yellow_)
            {
                if(prev_traffic_ != TRAFFIC_LIGHT_RED)
                {
				    traffic_light_msg.traffic_light = TRAFFIC_LIGHT_RED;
				    state_string_msg.data = TLR_RED_SIGNAL_STR;
                    prev_traffic_ = TRAFFIC_LIGHT_RED;
                    pub_signal_stat_.publish(traffic_light_msg);
		            pub_signal_stat_string_.publish(state_string_msg);
                }

                std_msgs::Float64 change_time_msg;
                change_time_msg.data = time_step_.time_step_yellow_ - time_range;
                pub_signal_change_time_.publish(change_time_msg);
                std_msgs::Float64 red_time_msg;
                red_time_msg.data = -1;
                pub_signal_red_change_time_.publish(red_time_msg);

                takeover_flag_ = false;
            }
            //red
            else
            {
                time_range -= time_step_.time_step_yellow_;
                if(prev_traffic_ != TRAFFIC_LIGHT_RED)
                {
                    traffic_light_msg.traffic_light = TRAFFIC_LIGHT_RED;
				    state_string_msg.data = TLR_RED_SIGNAL_STR;
                    prev_traffic_ = TRAFFIC_LIGHT_RED;
                    pub_signal_stat_.publish(traffic_light_msg);
		            pub_signal_stat_string_.publish(state_string_msg);
                }

                std_msgs::Float64 change_time_msg;
                change_time_msg.data = time_step_.time_step_red_ - time_range;
                pub_signal_change_time_.publish(change_time_msg);
                std_msgs::Float64 red_time_msg;
                red_time_msg.data = -1;
                pub_signal_red_change_time_.publish(red_time_msg);

                takeover_flag_ = false;
            }
        }
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "period_signal");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    PeriodSignal period_signal(nh, private_nh);

    ros::Rate rate(30);
    while(ros::ok())
    {
        ros::spinOnce();
        period_signal.run();
        rate.sleep();
    }

    return 0;
}