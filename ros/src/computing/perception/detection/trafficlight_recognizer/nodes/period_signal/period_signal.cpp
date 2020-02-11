#include <ros/ros.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "kvaser_microbus_can_sender_stroke");
	ros::NodeHandle nh;
	ros::NodeHandle private_nh("~");

    ros::spin();
    return 0;
}