#include <ros/ros.h>
#include <std_msgs/String.h>
#include <geometry_msgs/PoseStamped.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_datatypes.h>
#include <tf_conversions/tf_eigen.h>

struct DiffSum
{
    double x_, y_, z_;
    double yaw_sin_, yaw_cos_, pitch_sin_, pitch_cos_, roll_sin_, roll_cos_;
    unsigned int count_;

    void zero()
    {
        x_ = y_ = z_ = yaw_sin_ = yaw_cos_ = pitch_sin_ = pitch_cos_ = roll_sin_ = roll_cos_ = 0;
        count_ = 0;
    }

    tf::StampedTransform stampedTramsform()
    {
        tf::StampedTransform tfs;
        tfs.setOrigin(tf::Vector3(x_/count_, y_/count_, z_/count_));
        double ave_yaw = atan2(yaw_sin_/count_, yaw_cos_/count_);
        double ave_pitch = atan2(pitch_sin_/count_, pitch_cos_/count_);
        double ave_roll = atan2(roll_sin_/count_, roll_cos_/count_);
        tf::Quaternion qua;
        qua.setRPY(ave_roll, ave_pitch, ave_yaw);
        tfs.setRotation(qua);
        return tfs;
    }
};

class LidarGnssCalibrator
{
private:
    ros::NodeHandle nh_, private_nh_;
    ros::Publisher pub_tf_diff_;

    tf::TransformListener listener_;
    tf::TransformBroadcaster br_;
    tf::StampedTransform tf_gnss_base_, tf_getter_;
    DiffSum diff_sum_, end_diff_sum_;
public:
    LidarGnssCalibrator(ros::NodeHandle nh, ros::NodeHandle p_nh)
        : nh_(nh)
        , private_nh_(p_nh)
    {
        pub_tf_diff_ = nh_.advertise<std_msgs::String>("/localizer_diff", 1);
        diff_sum_.zero();
        end_diff_sum_.zero();

        double gx, gy, gz, gyaw, groll, gpitch;
        nh_.getParam("/gx", gx);
        nh_.getParam("/gy", gy);
        nh_.getParam("/gz", gz);
        nh_.getParam("/gyaw", gyaw);
        nh_.getParam("/groll", groll);
        nh_.getParam("/gpitch", gpitch);

        tf_gnss_base_.setOrigin(tf::Vector3(gx,gy,gz));
        tf::Quaternion qua;
        qua.setRPY(groll, gpitch, gyaw);
        tf_gnss_base_.setRotation(qua);
    }

    void calibrator()
    {
        std::string tf_frame_name1 = "rtk_base_link",  tf_frame_name2 = "ndt_base_link";
        std::string tf_ant_frame_name = "gps";

        bool wait_flag = listener_.waitForTransform(tf_frame_name1, tf_frame_name2,
                                                    ros::Time::now(), ros::Duration(1.0));
        if(wait_flag == true)
        { 
            listener_.lookupTransform(tf_frame_name1, tf_frame_name2, ros::Time(0), tf_getter_);
            diff_sum_.x_ += tf_getter_.getOrigin().getX();
            diff_sum_.y_ += tf_getter_.getOrigin().getY();
            diff_sum_.z_ += tf_getter_.getOrigin().getZ();

            tf::Matrix3x3 diff_rot;
            diff_rot = tf_getter_.getBasis();
            double roll, pitch, yaw;
            diff_rot.getRPY(roll, pitch, yaw);
            diff_sum_.yaw_sin_ += sin(yaw);  diff_sum_.yaw_cos_ += cos(yaw);
            diff_sum_.pitch_sin_ += sin(pitch);  diff_sum_.pitch_cos_ += cos(pitch);
            diff_sum_.roll_sin_ += sin(roll);  diff_sum_.roll_cos_ += cos(roll);
            diff_sum_.count_++;

            /*std::stringstream str;
            const int keta = 10;
            str << std::fixed << std::setprecision(keta) << "x," << diff_sum_.x_/diff_sum_.count_ << " y," << diff_sum_.y_/diff_sum_.count_ << " z," << diff_sum_.z_/diff_sum_.count_;
            double ave_yaw = atan2(diff_sum_.yaw_sin_/diff_sum_.count_, diff_sum_.yaw_cos_/diff_sum_.count_);
            double ave_pitch = atan2(diff_sum_.pitch_sin_/diff_sum_.count_, diff_sum_.pitch_cos_/diff_sum_.count_);
            double ave_roll = atan2(diff_sum_.roll_sin_/diff_sum_.count_, diff_sum_.roll_cos_/diff_sum_.count_);
            str << std::fixed << std::setprecision(keta) << " yaw," << ave_yaw << " pitch," << ave_pitch << " roll," << ave_roll;
            std_msgs::String ret;
            ret.data = str.str();
            pub_tf_diff_.publish(ret);*/

            std::cout << tf_getter_.frame_id_ << "," << tf_getter_.child_frame_id_ << std::endl;
            tf::StampedTransform write_tf = diff_sum_.stampedTramsform();
            write_tf.frame_id_ = tf_getter_.frame_id_;
            write_tf.child_frame_id_ = "calibrator_tf";
            write_tf.stamp_ = tf_getter_.stamp_;
            br_.sendTransform(write_tf);

            tf::Transform end_tf =  write_tf * tf_gnss_base_.inverse();
            br_.sendTransform(tf::StampedTransform(end_tf, ros::Time::now(), "gps", "end_tf"));

            end_diff_sum_.x_ += end_tf.getOrigin().getX();
            end_diff_sum_.y_ += end_tf.getOrigin().getY();
            end_diff_sum_.z_ += end_tf.getOrigin().getZ();

            tf::Matrix3x3 end_diff_rot = end_tf.getBasis();
            end_diff_rot.getRPY(roll, pitch, yaw);
            end_diff_sum_.yaw_sin_ += sin(yaw);  end_diff_sum_.yaw_cos_ += cos(yaw);
            end_diff_sum_.pitch_sin_ += sin(pitch);  end_diff_sum_.pitch_cos_ += cos(pitch);
            end_diff_sum_.roll_sin_ += sin(roll);  end_diff_sum_.roll_cos_ += cos(roll);
            end_diff_sum_.count_++;

            std::stringstream str;
            const int keta = 10;
            tf::Transform end_tf_inv = end_diff_sum_.stampedTramsform().inverse();
            str << std::fixed << std::setprecision(keta)
                << "x," << end_tf_inv.getOrigin().getX()
                << " y," << end_tf_inv.getOrigin().getY()
                << " z," << end_tf_inv.getOrigin().getZ();
            tf::Quaternion rot = end_tf_inv.getRotation();
            tf::Matrix3x3 mat(rot);
            mat.getRPY(roll, pitch, yaw);
            str << std::fixed << std::setprecision(keta) << " yaw," << yaw << " pitch," << pitch << " roll," << roll;
            std_msgs::String ret;
            ret.data = str.str();
            pub_tf_diff_.publish(ret);
        }
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "lidar_gnss_calibrator");
    ros::NodeHandle nh, private_nh_("~");

    LidarGnssCalibrator lgl(nh, private_nh_);

    ros::Rate rate(30);
    while(ros::ok())
    {
        ros::spinOnce();
        lgl.calibrator();
        rate.sleep();
    }

    return 0;
}