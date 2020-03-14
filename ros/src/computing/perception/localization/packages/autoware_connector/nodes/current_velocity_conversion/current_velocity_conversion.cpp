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
#include <autoware_msgs/LaneArray.h>
#include <current_velocity_conversion/waypoint_param_init.h>

class CurrentVelocityConversion
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_cruse_velocity_, pub_waypoints_;
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
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT:
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
                if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
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
        pub_waypoints_ = nh_.advertise<autoware_msgs::Lane>("/safety_waypoints", 10);

        sub_config_ = nh_.subscribe("/config/current_velocity_conversion", 1, &CurrentVelocityConversion::callbackConfig, this);
        sub_microbus_can502_ = nh_.subscribe("/microbus/can_receive502", 1, &CurrentVelocityConversion::callbackMicrobusCan502, this);
        sub_microbus_can503_ = nh_.subscribe("/microbus/can_receive503", 1, &CurrentVelocityConversion::callbackMicrobusCan503, this);
        sub_mobileye_obstacle_ = nh_.subscribe("/mobileye_obstacle", 1, &CurrentVelocityConversion::callbackMobileyeObstacle, this);

        config_.enable = false;
        config_.velocity_mode = autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT;
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
            lane.waypoints.emplace_back(wp);
        }

        pub_waypoints_.publish(lane);
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "current_velocity_conversion");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    CurrentVelocityConversion cvc(nh, private_nh);
    ros::Rate rate(100);
    while (ros::ok())
    {
        ros::spinOnce();
        cvc.createBaseLink();
        cvc.createWaypoints();
        rate.sleep();
    }
    
    return 0;
}