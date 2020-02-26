/*
 * Copyright 2015-2019 Autoware Foundation. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef CAN_ODOMETRY_CORE_H
#define CAN_ODOMETRY_CORE_H

// ROS includes
#include <geometry_msgs/TwistStamped.h>
#include <nav_msgs/Odometry.h>
#include <ros/ros.h>
#include <std_msgs/Float32.h>
#include <tf/transform_broadcaster.h>

// User Defined Includes
#include "autoware_can_msgs/CANInfo.h"
#include "autoware_msgs/VehicleStatus.h"
#include "autoware_can_msgs/MicroBusCan502.h"
#include "autoware_config_msgs/ConfigCanOdometry.h"

namespace autoware_connector
{
inline double kmph2mps(double velocity_kmph)
{
  return (velocity_kmph * 1000) / (60 * 60);
}

inline double mps2kmph(double velocity_mps)
{
  return (velocity_mps * 60 * 60) / 1000;
}

// convert degree to radian
inline double deg2rad(double deg)
{
  return deg * M_PI / 180;
}

// convert degree to radian
inline double rad2deg(double rad)
{
  return rad * 180 / M_PI;
}

struct VehicleInfo
{
  bool is_stored;
  double wheel_base;
  double minimum_turning_radius;
  double maximum_steering_angle;

  const double wheelrad_to_steering_can_value_left = 20935.4958411006;//20691.8161699557;//20952.8189547718;
  const double wheelrad_to_steering_can_value_right = 20791.4464661611;//20802.5331916036;//20961.415734248;
  const double angle_velocity_correction_slope_ = -0.0150859385;
  const double angle_velocity_correction_intersept_ = 1.1773688546;

  VehicleInfo()
  {
    is_stored = false;
    wheel_base = 0.0;
    minimum_turning_radius = 0.0;
    maximum_steering_angle = 0.0;
  }
  double convertSteeringAngleToAngularVelocity(const double cur_vel_mps, const double cur_angle_deg)  // rad/s
  {
	  std::cout << "tan : " << tan(deg2rad(getCurrentTireAngle(cur_angle_deg))) << "," << cur_angle_deg << std::endl;
    return is_stored ? tan(deg2rad(getCurrentTireAngle(cur_angle_deg))) * cur_vel_mps / wheel_base : 0;
  }
  double convertSteeringAngleToAngularVelocity_microbus(const double cur_vel_mps, const double angle_actual)
  {
      double wheel_val;
      if(angle_actual > 0)
      {
          wheel_val = angle_actual / wheelrad_to_steering_can_value_left;
      }
      else
      {
          wheel_val = angle_actual / wheelrad_to_steering_can_value_right;
      }
      //std::cout << "wheel : " << wheel_val << std::endl;
      double ret = tan(wheel_val) * cur_vel_mps / wheel_base;
      ros::Time time =  ros::Time::now();
      std::cout << "aaa," << cur_vel_mps << "," << ret << "," << time.sec<< "," << time.nsec << "," << wheel_val << std::endl;
      double hosei = (angle_velocity_correction_slope_ * cur_vel_mps + angle_velocity_correction_intersept_);
      if(hosei < 1) hosei = 1;
      ret *= hosei;
      return is_stored ? ret : 0;
  }
  double getCurrentTireAngle(const double angle_deg)  // steering [degree] -> tire [degree]
  {
    return is_stored ? angle_deg * getMaximumTireAngle() / maximum_steering_angle : 0;
  }
  double getMaximumTireAngle()  // degree
  {
    return is_stored ? rad2deg(asin(wheel_base / minimum_turning_radius)) : 0;
  }
};

struct Odometry
{
  double x;
  double y;
  double th;
  ros::Time stamp;

  Odometry(const ros::Time &time)
  {
    x = 0.0;
    y = 0.0;
    th = 0.0;
    stamp = time;
  }

  void updateOdometry(const double vx, const double vth, const ros::Time &cur_time)
  {
    if (stamp.sec == 0 && stamp.nsec == 0)
    {
      stamp = cur_time;
    }
    double dt = (cur_time - stamp).toSec();
    double delta_x = (vx * cos(th)) * dt;
    double delta_y = (vx * sin(th)) * dt;
    double delta_th = vth * dt;

    ROS_INFO("dt : %f delta (x y th) : (%f %f %f %f)", dt, delta_x, delta_y, delta_th);

    x += delta_x;
    y += delta_y;
    th += delta_th;
    stamp = cur_time;
  }
};

class CanOdometryNode
{
public:
  CanOdometryNode();
  ~CanOdometryNode();

  void run();

private:
  // handle
  ros::NodeHandle nh_;
  ros::NodeHandle private_nh_;

  autoware_config_msgs::ConfigCanOdometry config_;
  // publisher
  ros::Publisher pub1_, pub_can_velocity_;

  // subscriber
  ros::Subscriber sub1_;
  ros::Subscriber sub_bus_, sub_config_;

  // variables
  VehicleInfo v_info_;
  Odometry odom_;

  // callbacks
  void callbackConfig(const autoware_config_msgs::ConfigCanOdometry &msg);
  void callbackFromVehicleStatus(const autoware_msgs::VehicleStatusConstPtr &msg);
  void callbackFromVehicleStatus_microbus(const autoware_can_msgs::MicroBusCan502ConstPtr &msg);

  // initializer
  void initForROS();

  // functions
  void publishOdometry(const autoware_msgs::VehicleStatusConstPtr &msg);
};
}
#endif  // CAN_ODOMETRY_CORE_H
