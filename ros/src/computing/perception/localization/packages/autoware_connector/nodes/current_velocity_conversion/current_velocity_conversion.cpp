#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <autoware_config_msgs/ConfigCurrentVelocityConversion.h>
#include <autoware_msgs/MobileyeObstacle.h>
#include <autoware_can_msgs/MicroBusCan502.h>
#include <autoware_can_msgs/MicroBusCan503.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>

class CurrentVelocityConversion
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_cruse_velocity_;
    ros::Subscriber sub_config_, sub_twist_ ,sub_microbus_can502_, sub_microbus_can503_, sub_mobileye_obstacle_;
    ros::Subscriber sub_current_pose_;

    autoware_config_msgs::ConfigCurrentVelocityConversion config_;
    autoware_can_msgs::MicroBusCan502 microbus_can502_;
    autoware_can_msgs::MicroBusCan503 microbus_can503_;
    geometry_msgs::TwistStamped twist_;
    geometry_msgs::PoseStamped current_pose_;
    double cruse_velocity_;

    bool reference_mobileye_obstacle_;
    autoware_msgs::MobileyeObstacle mobileye_obstacle_;
    mobileye_560_660_msgs::ObstacleData prev_mobilete_obstacle_;

    tf::TransformListener listener_;
    tf::TransformBroadcaster br_;

    void callbackConfig(const autoware_config_msgs::ConfigCurrentVelocityConversion &msg)
    {
        config_ = msg;
        std::string enable_str = (config_.enable == true) ? "True" : "False";
        std::cout << "enable," << enable_str << std::endl;
        std::cout << "velocity_mode" << config_.velocity_mode << std::endl;
    }

    void callbackMobileyeObstacle(const autoware_msgs::MobileyeObstacle &msg)
    {
        mobileye_obstacle_ = msg;
    }

    void callbackTwist(const geometry_msgs::TwistStamped &msg)
    {
        twist_ = msg;
    }

    void callbackCurrentPose(const geometry_msgs::PoseStamped & msg)
    {
        current_pose_ = msg;
    }

    void callbackMicrobusCan502(const autoware_can_msgs::MicroBusCan502 &msg)
    {
        switch(config_.velocity_mode)
        {
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT:
            {
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
                break;
            }
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_TRAKING:
            {
                ros::Time nowtime = ros::Time::now();
                if(listener_.waitForTransform("map", "me_viz", msg.header.stamp, ros::Duration(0.5)) == true)
                {
                    tf::StampedTransform mobileye_transform;
                    listener_.lookupTransform("map", "me_viz", ros::Time(0), mobileye_transform);

                    for(double dis=0; dis<config_.search_distance; dis+config_.search_step)
                    {
                        tf::Pose tf_cur;
                        tf::poseMsgToTF(current_pose_.pose, tf_cur);
                        tf::Quaternion tf_cur_qua = tf_cur.getRotation();

                        /*for(int obj_i=0; obj_i<mobileye_obstacle_.data.size(); obj_i++)
                        {
                            mobileye_560_660_msgs::ObstacleData mobileye_obj;
                            for(int wid=0; wid<3; wid++)
                            {
                                tf::Transform tf_detction;
                                tf::Vector3 xyz;
                                //xyz.setX(mobileye_obj.obstacle_pos_x); xyz.setY(mobileye_obj.obstacle_pos_y + wid*mobileye_obj.obstacle_width/2.0);
                                tf_detction.setOrigin(tf::Vector3(mobileye_obj.obstacle_pos_x,
                                                                    mobileye_obj.obstacle_pos_y + wid*mobileye_obj.obstacle_width/2.0 -mobileye_obj.obstacle_width/2.0,
                                                                    0));
                                tf_detction.setRotation(tf::Quaternion::getIdentity());

                                std::stringstream str;
                                str << "m_detect" << obj_i << "_" << wid;
                                br_.sendTransform(tf::StampedTransform(tf_detction, nowtime, "me_viz", str.str().c_str()));

                                tf::StampedTransform tf_detect;
                                ros::Time t = ros::Time::now();
                                listener_.waitForTransform("map", str.str().c_str(), nowtime, ros::Duration(3.0));
                                listener_.lookupTransform("map", str.str().c_str(), nowtime, tf_detect);
                            }
                        }*/
                    }
                }
                break;
            }
        }
        microbus_can502_ = msg;
    }

    void callbackMicrobusCan503(const autoware_can_msgs::MicroBusCan503 &msg)
    {
        microbus_can503_ = msg;
    }
public:
    CurrentVelocityConversion(ros::NodeHandle nh, ros::NodeHandle p_nh)
        : cruse_velocity_(0)
        , reference_mobileye_obstacle_(false)
    {
        nh_ = nh;  private_nh_ = p_nh;

        pub_cruse_velocity_ = nh_.advertise<std_msgs::Float64>("/cruse_velocity", 10);
        sub_config_ = nh_.subscribe("/config/current_velocity_conversion", 1, &CurrentVelocityConversion::callbackConfig, this);
        sub_twist_ = nh_.subscribe("/velocity_relay", 10, &CurrentVelocityConversion::callbackTwist, this);
        sub_current_pose_ = nh_.subscribe("/current_pose", 10, &CurrentVelocityConversion::callbackCurrentPose, this);
        sub_microbus_can502_ = nh_.subscribe("/microbus/can_receive502", 1, &CurrentVelocityConversion::callbackMicrobusCan502, this);
        sub_microbus_can503_ = nh_.subscribe("/microbus/can_receive503", 1, &CurrentVelocityConversion::callbackMicrobusCan503, this);
        sub_mobileye_obstacle_ = nh_.subscribe("/mobileye_obstacle", 1, &CurrentVelocityConversion::callbackMobileyeObstacle, this);

        config_.enable = false;
        config_.velocity_mode = autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT;
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