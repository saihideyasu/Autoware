#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float64.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/PoseStamped.h>
#include <autoware_config_msgs/ConfigCurrentVelocityConversion.h>
#include <autoware_msgs/MobileyeObstacle.h>
#include <autoware_can_msgs/MicroBusCan502.h>
#include <autoware_can_msgs/MicroBusCan503.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <autoware_msgs/LaneArray.h>
#include <current_velocity_conversion/waypoint_param_init.h>

struct VelodyneLocalizer
{
    double x_, y_, z_, yaw_, roll_, pitch_;
};

class CurrentVelocityConversion
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_cruse_velocity_, pub_waypoints_, pub_current_pose_, pub_current_velocity_, pub_localizer_pose_;
    ros::Publisher pub_closest_waypoint_;

    ros::Subscriber sub_config_, sub_microbus_can502_, sub_microbus_can503_, sub_mobileye_obstacle_;

    autoware_config_msgs::ConfigCurrentVelocityConversion config_;
    autoware_can_msgs::MicroBusCan502 microbus_can502_;
    autoware_can_msgs::MicroBusCan503 microbus_can503_;
    double cruse_velocity_;

    bool reference_mobileye_obstacle_;
    autoware_msgs::MobileyeObstacle mobileye_obstacle_;
    mobileye_560_660_msgs::ObstacleData prev_mobilete_obstacle_;

    tf::TransformListener listener_;
    tf::TransformBroadcaster br_;

    VelodyneLocalizer velodyne_localizer_;
    bool init_flag_;

    void callbackConfig(const autoware_config_msgs::ConfigCurrentVelocityConversion &msg)
    {
        config_ = msg;
        std::string enable_str = (config_.enable == true) ? "True" : "False";
        std::cout << "enable," << enable_str << std::endl;
        std::cout << "velocity_mode" << config_.velocity_mode << std::endl;

        if(config_.velocity_mode != msg.velocity_mode) cruse_velocity_ = 0;//safety
    }

    void callbackMobileyeObstacle(const autoware_msgs::MobileyeObstacle &msg)
    {
        mobileye_obstacle_ = msg;
    }

    void publishCruseVelocity(double vel)
    {
        std_msgs::Float64 cruse;
        cruse.data = vel;
        pub_cruse_velocity_.publish(cruse);
    }

    void callbackMicrobusCan502(const autoware_can_msgs::MicroBusCan502 &msg)
    {
        ros::Time nowtime = ros::Time::now();

        switch(config_.velocity_mode)
        {
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT_DIRECT:
            {
                if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
                {
                    publishCruseVelocity(config_.constant_velocity / 3.6);
                }
                else
                {
                    publishCruseVelocity(0);
                }
                break;
            }
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN_DIRECT:
            {
                if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
                {
                    publishCruseVelocity(cruse_velocity_);
                }
                else
                {
                    cruse_velocity_  = msg.velocity_mps;
                    publishCruseVelocity(0);
                }
                break;
            }
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_TRAKING:
            {
                /*if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
                {
                    publishCruseVelocity(0);
                }
                else if(mobileye_obstacle_.data.size() == 0)
                {
                    publishCruseVelocity(0);
                }
                else
                {
                    //object tf publish
                    {
                        int cou = 0;
                        for(int obj_i=0; obj_i<mobileye_obstacle_.data.size(); obj_i++)
                        {
                            mobileye_560_660_msgs::ObstacleData mbi_obj = mobileye_obstacle_.data[obj_i];

                            switch(mbi_obj.obstacle_type)
                            {
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_VEHICLE:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_TRUCK:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_BIKE:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_PED:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_BICYCLE:
                                {
                                    for(int y=0; y<=3; y++)
                                    {
                                        tf::Transform tf_detction;
                                        tf_detction.setOrigin(tf::Vector3(mbi_obj.obstacle_pos_x,
                                                                            mbi_obj.obstacle_pos_y + y*mbi_obj.obstacle_width/2.0 -mbi_obj.obstacle_width/2.0,
                                                                            0));
                                        tf_detction.setRotation(tf::Quaternion::getIdentity());
                                        std::stringstream str;
                                        str << "m_detect" << obj_i << "_" << y;
                                        br_.sendTransform(tf::StampedTransform(tf_detction, nowtime, "me_viz", str.str().c_str()));
                                    }
                                    cou++;
                                    break;
                                }
                            }
                        }

                        if(cou == 0)
                        {
                            publishCruseVelocity(0);
                            break;
                        }
                    }

                    for(double step=0; step<config_.search_step_count; step+=config_.search_step)
                    {
                        //for(mobileye_560_660_msgs::ObstacleData mbi_obj : mobileye_obstacle_.data)
                        for(int obj_i=0; obj_i<mobileye_obstacle_.data.size(); obj_i++)
                        {
                            mobileye_560_660_msgs::ObstacleData mbi_obj = mobileye_obstacle_.data[obj_i];

                            switch(mbi_obj.obstacle_type)
                            {
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_VEHICLE:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_TRUCK:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_BIKE:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_PED:
                                case mobileye_560_660_msgs::ObstacleData::OBSTACLE_TYPE_BICYCLE:
                                {
                                    for(int y=0; y<=mbi_obj.obstacle_width; y+=mbi_obj.obstacle_width/2.0)
                                    {
                                        tf::StampedTransform tf_obj;
                                        tf::Vector3 obj_vector((tfScalar)mbi_obj.obstacle_pos_x,
                                                                (tfScalar)mbi_obj.obstacle_pos_y + y*mbi_obj.obstacle_width/2.0 - mbi_obj.obstacle_width/2.0,
                                                                (tfScalar)0);
                                        tf::Vector3 point_vector(step, 0, 0);
                                        double dt = tf::tfDistance(point_vector, obj_vector);

                                        if(dt <= config_.search_distance)
                                        {
                                            publishCruseVelocity(mbi_obj.obstacle_rel_vel_x);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }*/
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
        , init_flag_(false)
    {
        nh_ = nh;  private_nh_ = p_nh;

        if (nh_.getParam("tf_x", velodyne_localizer_.x_) == false)
        {
          std::cout << "tf_x is not set." << std::endl;
          return;
        }
        if (nh_.getParam("tf_y", velodyne_localizer_.y_) == false)
        {
          std::cout << "tf_y is not set." << std::endl;
          return;
        }
        if (nh_.getParam("tf_z", velodyne_localizer_.z_) == false)
        {
          std::cout << "tf_z is not set." << std::endl;
          return;
        }
        if (nh_.getParam("tf_roll", velodyne_localizer_.roll_) == false)
        {
          std::cout << "tf_roll is not set." << std::endl;
          return;
        }
        if (nh_.getParam("tf_pitch", velodyne_localizer_.pitch_) == false)
        {
          std::cout << "tf_pitch is not set." << std::endl;
          return;
        }
        if (nh_.getParam("tf_yaw", velodyne_localizer_.yaw_) == false)
        {
          std::cout << "tf_yaw is not set." << std::endl;
          return;
        }

        pub_cruse_velocity_ = nh_.advertise<std_msgs::Float64>("/cruse_velocity", 1);
        pub_waypoints_ = nh_.advertise<autoware_msgs::Lane>("/safety_waypoints", 1);
        pub_current_pose_ = nh_.advertise<geometry_msgs::PoseStamped>("/current_pose", 1);
        pub_current_velocity_ = nh_.advertise<geometry_msgs::TwistStamped>("/current_velocity", 1);
        pub_localizer_pose_ = nh_.advertise<geometry_msgs::PoseStamped>("/localizer_pose", 1);
        pub_closest_waypoint_ = nh_.advertise<std_msgs::Int32>("/closest_waypoint", 1);

        sub_config_ = nh_.subscribe("/config/current_velocity_conversion", 1, &CurrentVelocityConversion::callbackConfig, this);
        sub_microbus_can502_ = nh_.subscribe("/microbus/can_receive502", 1, &CurrentVelocityConversion::callbackMicrobusCan502, this);
        sub_microbus_can503_ = nh_.subscribe("/microbus/can_receive503", 1, &CurrentVelocityConversion::callbackMicrobusCan503, this);
        sub_mobileye_obstacle_ = nh_.subscribe("/mobileye_obstacle", 1, &CurrentVelocityConversion::callbackMobileyeObstacle, this);

        config_.enable = false;
        config_.velocity_mode = autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT;

        init_flag_ = true;
    }

    bool isInit() {return init_flag_;}
    bool enable() {return config_.enable;}
    bool publishOK()
    {
        if(config_.velocity_mode == autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT
           || config_.velocity_mode == autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN
           || config_.velocity_mode == autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_TRAKING)
           return true;
        else return false;
    }

    void createBaseLink()
    {
        ros::Time nowtime = ros::Time::now();
        tf::Transform baselink_tf;
        baselink_tf.setOrigin(tf::Vector3(0, 0, 0));
        baselink_tf.setRotation(tf::Quaternion::getIdentity());
        br_.sendTransform(tf::StampedTransform(baselink_tf, nowtime, "map", "base_link"));
    }

    void createWaypoints()
    {
        autoware_msgs::Lane lane;
        lane.header.frame_id = "map";
        lane.header.stamp = ros::Time::now();

        unsigned int id = 0;
        for(double step=0; step<config_.search_step_count; step+=config_.search_step, id++)
        {
            autoware_msgs::Waypoint wp;
            waypoint_maker::waypoint_param_init(&wp, id);
            wp.pose.pose.position.x = step;
            switch(config_.velocity_mode)
            {
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT:
                wp.twist.twist.linear.x = config_.constant_velocity / 3.6;
                break;    
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN:
                wp.twist.twist.linear.x = cruse_velocity_;
                break;
            }
            lane.waypoints.emplace_back(wp);
        }

        pub_waypoints_.publish(lane);
    }

    void createCurrentPose()
    {
        ros::Time nowtime = ros::Time::now();

        geometry_msgs::PoseStamped current_pose_msg;
        current_pose_msg.header.frame_id = "map";
        current_pose_msg.header.stamp = nowtime;
        current_pose_msg.pose.position.x = 0;
        current_pose_msg.pose.position.x = 0;
        current_pose_msg.pose.position.x = 0;
        current_pose_msg.pose.orientation.x = 0;
        current_pose_msg.pose.orientation.y = 0;
        current_pose_msg.pose.orientation.z = 0;
        current_pose_msg.pose.orientation.w = 1;
        pub_current_pose_.publish(current_pose_msg);

        geometry_msgs::TwistStamped current_velocity_msg;
        current_velocity_msg.header.frame_id = "base_link";
        current_velocity_msg.header.stamp = nowtime;
        current_velocity_msg.twist.linear.x = microbus_can502_.velocity_mps;
        current_velocity_msg.twist.linear.y = 0;
        current_velocity_msg.twist.linear.z = 0;
        current_velocity_msg.twist.angular.x = 0;
        current_velocity_msg.twist.angular.y = 0;
        current_velocity_msg.twist.angular.z = 0;
        pub_current_velocity_.publish(current_velocity_msg);

        geometry_msgs::PoseStamped localizer_pose_msg;
        localizer_pose_msg.header.frame_id = "map";
        localizer_pose_msg.header.stamp = nowtime;
        localizer_pose_msg.pose.position.x = velodyne_localizer_.x_;
        localizer_pose_msg.pose.position.y = velodyne_localizer_.y_;
        localizer_pose_msg.pose.position.z = velodyne_localizer_.z_;
        tf::Quaternion qua = tf::createQuaternionFromRPY(velodyne_localizer_.roll_, velodyne_localizer_.pitch_, velodyne_localizer_.yaw_);
        localizer_pose_msg.pose.orientation.x = qua.getX();
        localizer_pose_msg.pose.orientation.y = qua.getY();
        localizer_pose_msg.pose.orientation.z = qua.getZ();
        localizer_pose_msg.pose.orientation.w = qua.getW();
        pub_localizer_pose_.publish(localizer_pose_msg);

        std_msgs::Int32 closest_waypoint_msg;
        closest_waypoint_msg.data = 0;
        pub_closest_waypoint_.publish(closest_waypoint_msg);
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "current_velocity_conversion");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    CurrentVelocityConversion cvc(nh, private_nh);
    if(cvc.isInit())
    {
        ros::Rate rate(100);
        while (ros::ok())
        {
            ros::spinOnce();
            if(cvc.enable() && cvc.publishOK())
            {
                cvc.createBaseLink();
                cvc.createWaypoints();
                cvc.createCurrentPose();
            }
            rate.sleep();
        }
    }

    return 0;
}