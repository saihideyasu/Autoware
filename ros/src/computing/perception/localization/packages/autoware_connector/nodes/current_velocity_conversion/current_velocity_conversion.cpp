#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float64.h>
#include <std_msgs/String.h>
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
#include <mobileye_560_660_msgs/LkaLane.h>

struct VelodyneLocalizer
{
    double x_, y_, z_, yaw_, roll_, pitch_;
};

class CurrentVelocityConversion
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_cruse_velocity_mps_, pub_waypoints_, pub_current_pose_, pub_current_velocity_, pub_localizer_pose_;
    ros::Publisher pub_closest_waypoint_, pub_error_string_;

    ros::Subscriber sub_config_, sub_microbus_can502_, sub_microbus_can503_, sub_mobileye_obstacle_;
    ros::Subscriber sub_mobileye_left_lka_lane_, sub_mobileye_right_lka_lane_;

    autoware_config_msgs::ConfigCurrentVelocityConversion config_;
    autoware_can_msgs::MicroBusCan502 microbus_can502_;
    autoware_can_msgs::MicroBusCan503 microbus_can503_;
    double cruse_velocity_mps_;

    bool reference_mobileye_obstacle_;
    autoware_msgs::MobileyeObstacle mobileye_obstacle_;
    mobileye_560_660_msgs::ObstacleData prev_mobilete_obstacle_;
    mobileye_560_660_msgs::LkaLane left_lane_, right_lane_;

    tf::TransformListener listener_;
    tf::TransformBroadcaster br_;

    VelodyneLocalizer velodyne_localizer_;
    bool init_flag_;

    const unsigned char lane_quality_th_ = 2;

    double lka_math(double z)
    {
        double left_x_not_c0=0, right_x_not_c0=0;
        double left_x=0, right_x=0;
        if(left_lane_.quality >= lane_quality_th_)
        {
            double c3 = left_lane_.curvature_derivative_parameter_c3;
            double c2 = left_lane_.curvature_parameter_c2;
            double c1 = left_lane_.heading_angle_parameter_c1;
            left_x_not_c0 = c3*z*z*z + c2*z*z + c1*z;
            double c0 = left_lane_.position_parameter_c0;
            left_x = left_x_not_c0 + c0;
        }
        if(right_lane_.quality >= lane_quality_th_)
        {
            double c3 = right_lane_.curvature_derivative_parameter_c3;
            double c2 = right_lane_.curvature_parameter_c2;
            double c1 = right_lane_.heading_angle_parameter_c1;
            right_x_not_c0 = c3*z*z*z + c2*z*z + c1*z;
            double c0 = right_lane_.position_parameter_c0;
            right_x = right_x_not_c0 + c0;
        }

        if(left_x == 0 && right_x == 0)
            return 0;
        else if(left_x != 0 && right_x == 0)
            return left_x_not_c0;
        else if(left_x == 0 && right_x != 0)
            return right_x_not_c0;
        else
            return (left_x + right_x) / 2;
    }

    void callbackConfig(const autoware_config_msgs::ConfigCurrentVelocityConversion &msg)
    {
        config_ = msg;
        std::string enable_str = (config_.enable == true) ? "True" : "False";
        std::cout << "enable," << enable_str << std::endl;
        std::cout << "velocity_mode" << config_.velocity_mode << std::endl;

        if(config_.velocity_mode != msg.velocity_mode) cruse_velocity_mps_ = 0;//safety
    }

    void callbackMobileyeLeftLkaLane(const mobileye_560_660_msgs::LkaLane &msg)
    {
        left_lane_ = msg;
    }

    void callbackMobileyeRightLkaLane(const mobileye_560_660_msgs::LkaLane &msg)
    {
        right_lane_ = msg;
    }

    void callbackMobileyeObstacle(const autoware_msgs::MobileyeObstacle &msg)
    {
        mobileye_obstacle_ = msg;
    }

    void publishCruseVelocity(double vel)
    {
        std_msgs::Float64 cruse;
        cruse.data = vel;
        pub_cruse_velocity_mps_.publish(cruse);
    }

    void callbackMicrobusCan502(const autoware_can_msgs::MicroBusCan502 &msg)
    {
        ros::Time nowtime = ros::Time::now();

        if(config_.enable == false) return;

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
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN:
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_CAN:
            {
                if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
                {
                }
                else
                {
                    cruse_velocity_mps_  = msg.velocity_mps;
                }

                if(msg.clutch == true && (left_lane_.quality < lane_quality_th_ || right_lane_.quality < lane_quality_th_))
                {
                    std::stringstream str;
                    str << "error : lane left quality," << left_lane_.quality << "   right lane quality," << right_lane_.quality;
                    std_msgs::String msg_str;
                    msg_str.data = str.str();
                    pub_error_string_.publish(msg_str);
                }
                break;
            }
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN_DIRECT:
            {
                if(config_.enable == true && microbus_can503_.clutch == true && msg.clutch == false)
                {
                    publishCruseVelocity(cruse_velocity_mps_);
                }
                else
                {
                    cruse_velocity_mps_  = msg.velocity_mps;
                    publishCruseVelocity(0);
                }

                if(msg.clutch == true && (left_lane_.quality < lane_quality_th_ || right_lane_.quality < lane_quality_th_))
                {
                    std::stringstream str;
                    str << "error : lane left quality," << left_lane_.quality << "   right lane quality," << right_lane_.quality;
                    std_msgs::String msg_str;
                    msg_str.data = str.str();
                    pub_error_string_.publish(msg_str);
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
        : cruse_velocity_mps_(0)
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

        pub_cruse_velocity_mps_ = nh_.advertise<std_msgs::Float64>("/cruse_velocity", 1);
        pub_waypoints_ = nh_.advertise<autoware_msgs::Lane>("/base_waypoints", 1);
        pub_current_pose_ = nh_.advertise<geometry_msgs::PoseStamped>("/current_pose", 1);
        pub_current_velocity_ = nh_.advertise<geometry_msgs::TwistStamped>("/current_velocity", 1);
        pub_localizer_pose_ = nh_.advertise<geometry_msgs::PoseStamped>("/localizer_pose", 1);
        pub_closest_waypoint_ = nh_.advertise<std_msgs::Int32>("/closest_waypoint", 1);
        pub_error_string_ = nh_.advertise<std_msgs::String>("/cruse_error", 1);

        sub_config_ = nh_.subscribe("/config/current_velocity_conversion", 1, &CurrentVelocityConversion::callbackConfig, this);
        sub_microbus_can502_ = nh_.subscribe("/microbus/can_receive502", 1, &CurrentVelocityConversion::callbackMicrobusCan502, this);
        sub_microbus_can503_ = nh_.subscribe("/microbus/can_receive503", 1, &CurrentVelocityConversion::callbackMicrobusCan503, this);
        sub_mobileye_obstacle_ = nh_.subscribe("/mobileye_obstacle", 1, &CurrentVelocityConversion::callbackMobileyeObstacle, this);
        sub_mobileye_left_lka_lane_ = nh_.subscribe("/parsed_tx/left_lka_lane", 1, &CurrentVelocityConversion::callbackMobileyeLeftLkaLane, this);
        sub_mobileye_right_lka_lane_ = nh_.subscribe("/parsed_tx/right_lka_lane", 1, &CurrentVelocityConversion::callbackMobileyeRightLkaLane, this);
    
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
           || config_.velocity_mode == autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_CONSTANT
           || config_.velocity_mode == autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_CAN)
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

    /*double mobileye_velocity(ros::Time nowtime)
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
        }//obj_i

        if(cou > 0)
        {
            for(double step=0; step<config_.search_step_count; step+=config_.search_step)
            {
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
                                    return mbi_obj.obstacle_rel_vel_x;
                                }
                            }
                        }
                    }
                }//obj_i
            }//step
        }
        
        return -100;
    }*/

    void createWaypoints()
    {
        ros::Time nowtime = ros::Time::now();
        autoware_msgs::Lane lane;
        lane.header.frame_id = "map";
        lane.header.stamp = nowtime;

        double constant_vel_mps = config_.constant_velocity / 3.6;

        unsigned int id = 0;
        for(double step=0; step<config_.search_step_count; step+=config_.search_step, id++)
        {
            autoware_msgs::Waypoint wp;
            waypoint_maker::waypoint_param_init(&wp, id);
            wp.pose.pose.position.x = step;

            switch(config_.velocity_mode)
            {
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CONSTANT:
                wp.twist.twist.linear.x = constant_vel_mps;
                break;    
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_CAN:
                wp.twist.twist.linear.x = cruse_velocity_mps_;
                break;
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_CONSTANT:
                wp.twist.twist.linear.x = constant_vel_mps;
                wp.pose.pose.position.y = lka_math(wp.pose.pose.position.x);
                break;
            case autoware_config_msgs::ConfigCurrentVelocityConversion::VELOCITY_MODE_MOBILEYE_CAN:
                wp.twist.twist.linear.x = cruse_velocity_mps_;
                wp.pose.pose.position.y = lka_math(wp.pose.pose.position.x);
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