#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <geometry_msgs/TwistStamped.h>
#include <autoware_config_msgs/ConfigCurrentVelocityConversion.h>
#include <autoware_can_msgs/MicroBusCan502.h>
#include <autoware_can_msgs/MicroBusCan503.h>

class CurrentVelocityConversion
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_cruse_velocity_;
    ros::Subscriber sub_config_, sub_twist_ ,sub_microbus_can502_, sub_microbus_can503_, sub_cruse;

    autoware_config_msgs::ConfigCurrentVelocityConversion config_;
    autoware_can_msgs::MicroBusCan502 microbus_can502_;
    autoware_can_msgs::MicroBusCan503 microbus_can503_;
    geometry_msgs::TwistStamped twist_;
    double cruse_velocity_;

    void callbackConfig(const autoware_config_msgs::ConfigCurrentVelocityConversion &msg)
    {
        config_ = msg;
    }

    void callbackTwist(const geometry_msgs::TwistStamped &msg)
    {
        twist_ = msg;
    }

    void callbackMicrobusCan502(const autoware_can_msgs::MicroBusCan502 &msg)
    {
        microbus_can502_ = msg;
        if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
        {
            std_msgs::Float64 cruse;
            cruse.data = cruse_velocity_;
            pub_cruse_velocity_.publish(cruse);
        }
        else
        {
            cruse_velocity_  = msg.velocity_mps;
            std_msgs::Float64 cruse;
            cruse.data = 0;
            pub_cruse_velocity_.publish(cruse);
        }
    }

    void callbackMicrobusCan503(const autoware_can_msgs::MicroBusCan503 &msg)
    {
        microbus_can503_ = msg;
    }
public:
    CurrentVelocityConversion(ros::NodeHandle nh, ros::NodeHandle p_nh)
        : cruse_velocity_(0)
    {
        nh_ = nh;  private_nh_ = p_nh;

        pub_cruse_velocity_ = nh_.advertise<std_msgs::Float64>("/cruse_velocity", 10);
        sub_config_ = nh_.subscribe("/config/current_velocity_conversion", 1, &CurrentVelocityConversion::callbackConfig, this);
        sub_twist_ = nh_.subscribe("/velocity_relay", 10, &CurrentVelocityConversion::callbackTwist, this);
        sub_microbus_can502_ = nh_.subscribe("/microbus/can_receive502", 1, &CurrentVelocityConversion::callbackMicrobusCan502, this);
        sub_microbus_can503_ = nh_.subscribe("/microbus/can_receive503", 1, &CurrentVelocityConversion::callbackMicrobusCan503, this);
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "current_velocity_conversion");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    CurrentVelocityConversion cvc(nh, private_nh);
    ros::spin();
    return 0;
}