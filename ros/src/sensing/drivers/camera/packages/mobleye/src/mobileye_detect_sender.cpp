#include <ros/ros.h>
#include <mobileye_560_660_msgs/ObstacleData.h>
#include <autoware_msgs/MobileyeObstacle.h>

class AutowareMobileye
{
private:
    ros::NodeHandle nh_, private_nh_;

    ros::Publisher pub_mobileye_obstacle_;
    ros::Subscriber sub_obstacle_data_;

    std::vector<mobileye_560_660_msgs::ObstacleData> obstacle_data_;
    ros::Timer timer;

    void publish()
    {
        autoware_msgs::MobileyeObstacle pub;
        pub.header.stamp = ros::Time::now();
        pub.data = obstacle_data_;
        pub_mobileye_obstacle_.publish(pub);
    }

    void callbackObstacelData(const mobileye_560_660_msgs::ObstacleData &msg)
    {
        int cou;
        for(cou=0; cou<obstacle_data_.size(); cou++)
        {
            if(obstacle_data_[cou].obstacle_id == msg.obstacle_id)
            {
                obstacle_data_.erase(obstacle_data_.begin() + cou);
                break;
            }
        }
        obstacle_data_.push_back(msg);
        publish();
    }

    void callbackTimer(const ros::TimerEvent& msg)
    {
        const ros::Duration th(1.0, 0);
        ros::Time nowtime = ros::Time::now();
        bool flag = false;
        for(int cou=0; cou<obstacle_data_.size(); cou++)
        {
            ros::Duration st = nowtime - obstacle_data_[cou].header.stamp;
            if(st > th)
            {
                obstacle_data_.erase(obstacle_data_.begin() + cou);
                flag = true;
            }
        }
        if(flag == true) publish();
    }
public:
    AutowareMobileye(ros::NodeHandle nh, ros::NodeHandle p_nh)
    {
        nh_ = nh;  private_nh_ = p_nh;

        pub_mobileye_obstacle_ = nh_.advertise<autoware_msgs::MobileyeObstacle>("/mobileye_obstacle", 1);
        sub_obstacle_data_ = nh.subscribe("/parsed_tx/obstacle_data", 1, &AutowareMobileye::callbackObstacelData, this);
        timer = nh.createTimer(ros::Duration(0.1), &AutowareMobileye::callbackTimer, this);
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "autoware_mobileye");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    AutowareMobileye am(nh, private_nh);

    ros::spin();
    return 0;
}