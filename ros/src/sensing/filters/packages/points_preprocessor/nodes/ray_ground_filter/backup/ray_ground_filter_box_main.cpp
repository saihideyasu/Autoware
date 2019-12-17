
#include <ros/ros.h>
#include "ray_ground_filter_box.h"


int main(int argc, char **argv)
{
	ros::init(argc, argv, "ray_ground_filter_box");
	RayGroundFilterBox app;

	app.Run();

	return 0;

}
