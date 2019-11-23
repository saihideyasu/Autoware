/*
 *  Copyright (c) 2015, Nagoya University
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 *  * Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *  * Neither the name of Autoware nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "nmea2tfpose_core_RTK.h"
#include <std_msgs/Float64.h>
#include <autoware_msgs/GnssStandardDeviation.h>
#include <autoware_msgs/GnssSurfaceSpeed.h>

const unsigned int LAST_GEO_SIZE=5;

namespace gnss_localizer
{

double degrees_minutes_seconds(double deg)
{
	int degrees = (int)deg;
	double d_minutes = (deg-degrees)*60.0;
	int minutes = (int)d_minutes;
	double seconds = (d_minutes-minutes)*60.0;
	//return degrees*100.0+minutes+seconds/100.0;
	return degrees*100.0+d_minutes;
}

// Constructor
Nmea2TFPoseNode::Nmea2TFPoseNode()
  : private_nh_("~")
  , MAP_FRAME_("map")
  , GPS_FRAME_("gps")
  , roll_(0)
  , pitch_(0)
  , yaw_(0)
  , orientation_time_(0)
  , position_time_(0)
  , current_time_(0)
  , orientation_stamp_(0)
  , last_geo_(LAST_GEO_SIZE)
  , gphdt_value(0)
  , lat_std(0)
  , lon_std(0)
  , alt_std(0)
  , surface_speed_(0)
  , hdt_add_(0)
  , curve_flag(0)
  , x_accel_(0.0)
  , y_accel_(0.0)
  , z_accel_(0.0)
{
  initForROS();
  geo_.set_plane(plane_number_);
  geo2_.set_plane(plane_number_);
}

// Destructor
Nmea2TFPoseNode::~Nmea2TFPoseNode()
{
}

void Nmea2TFPoseNode::callbackHDTAdd(const std_msgs::Float64::ConstPtr &msg)
{
  hdt_add_ = msg->data;
}

void Nmea2TFPoseNode::callbackPositionAddX(const std_msgs::Float64::ConstPtr &msg)
{
  position_add_x_ = msg->data;
}

void Nmea2TFPoseNode::callbackPositionAddY(const std_msgs::Float64::ConstPtr &msg)
{
  position_add_y_ = msg->data;
}

void Nmea2TFPoseNode::initForROS()
{
  // ros parameter settings
  private_nh_.getParam("plane", plane_number_);

  // setup subscriber
  sub1_ = nh_.subscribe("nmea_sentence", 100, &Nmea2TFPoseNode::callbackFromNmeaSentence, this);
  sub_hdt_add= nh_.subscribe("hdt_add", 100, &Nmea2TFPoseNode::callbackHDTAdd, this);
  sub_position_add_x= nh_.subscribe("position_add_x", 100, &Nmea2TFPoseNode::callbackPositionAddX, this);
  sub_position_add_y= nh_.subscribe("position_add_y", 100, &Nmea2TFPoseNode::callbackPositionAddY, this);
  sub_waypoint_param= nh_.subscribe("/waypoint_param", 100, &Nmea2TFPoseNode::callbackWaypointParam, this);

  // setup publisher
  pub1_ = nh_.advertise<geometry_msgs::PoseStamped>("gnss_pose", 10);
  pub_hdt = nh_.advertise<std_msgs::Float64>("gnss_hdt", 10);
  pub_std = nh_.advertise<autoware_msgs::GnssStandardDeviation>("gnss_standard_deviation", 10);
  pub_surface_speed = nh_.advertise<autoware_msgs::GnssSurfaceSpeed>("gnss_surface_speed", 10);
  pub_imu_ = nh_.advertise<sensor_msgs::Imu>("gnss_imu", 10);
}

void Nmea2TFPoseNode::run()
{
  ros::spin();
}

void Nmea2TFPoseNode::publishPoseStamped()
{
  geometry_msgs::PoseStamped pose;
  pose.header.frame_id = MAP_FRAME_;
  pose.header.stamp = current_time_;
  pose.pose.position.x = geo_.y() + position_add_x_;
  pose.pose.position.y = geo_.x() + position_add_y_;
  pose.pose.position.z = geo_.z();
  pose.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(roll_, pitch_, yaw_);
  pub1_.publish(pose);

  std_msgs::Float64 hdt;
  hdt.data = yaw_;//gphdt_value;
  pub_hdt.publish(hdt);

  autoware_msgs::GnssStandardDeviation gsd;
  gsd.header.frame_id = MAP_FRAME_;
  gsd.header.stamp = current_time_;
  gsd.lat_std = lat_std;
  gsd.lon_std = lon_std;
  gsd.alt_std = alt_std;
  pub_std.publish(gsd);

  autoware_msgs::GnssSurfaceSpeed gss;
  gss.header.frame_id = MAP_FRAME_;
  gss.header.stamp = current_time_;
  gss.surface_speed = surface_speed_;
  pub_surface_speed.publish(gss);

  sensor_msgs::Imu imu;
  imu.header.frame_id = MAP_FRAME_;
  imu.header.stamp = current_time_;
  imu.linear_acceleration.x = x_accel_;
  imu.linear_acceleration.y = y_accel_;
  imu.linear_acceleration.z = z_accel_;
  imu.angular_velocity.x = x_gyro_;
  imu.angular_velocity.y = y_gyro_;
  imu.angular_velocity.z = z_gyro_;
  pub_imu_.publish(imu);
}

void Nmea2TFPoseNode::publishTF()
{
  tf::Transform transform;
  transform.setOrigin(tf::Vector3(geo_.y(), geo_.x(), geo_.z()));
  tf::Quaternion quaternion;
  quaternion.setRPY(roll_, pitch_, yaw_);
  transform.setRotation(quaternion);
  br_.sendTransform(tf::StampedTransform(transform, current_time_, MAP_FRAME_, GPS_FRAME_));
}

void Nmea2TFPoseNode::createOrientation()
{
  //yaw_ = atan2(geo_.x() - last_geo_.x(), geo_.y() - last_geo_.y());
  //yaw_ = last_geo_.returnAngle_movingAverage(2);
  //yaw_ = gphdt_value + hdt_add_*M_PI/180.0;//-30*M_PI/180.0;
  //yaw_ = last_geo_.returnHDT_movingAverage();
  /*if(curve_flag == 0)
	yaw_ = -1*last_geo_.returnHDT_movingAverage()+M_PI/2;
  else
	yaw_ = gphdt_value;*/
  //yaw_ = atan2(geo2_.x() - geo_.x(), geo2_.y() - geo_.y());
  roll_ = 0;
  pitch_ = 0;

  //std::cout<<"atan2 : "<<yaw_*180/M_PI<<std::endl;
  //std::cout<<"hdt   : "<<gphdt_value*180/M_PI<<std::endl;
}

double Nmea2TFPoseNode::dig2rad(double dig)
{
	while(dig <0 || dig >=360){
		if(dig<0) dig+=360;
	  else if(dig>=360) dig-=360;
	}
	return dig*M_PI/180.0;
}

void Nmea2TFPoseNode::convert(std::vector<std::string> nmea, ros::Time current_stamp)
{
  try
  {
		/*if (nmea.at(0).compare(0, 2, "QQ") == 0)
	{
	  orientation_time_ = stod(nmea.at(3));
	  roll_ = stod(nmea.at(4)) * M_PI / 180.;
	  pitch_ = -1 * stod(nmea.at(5)) * M_PI / 180.;
	  yaw_ = -1 * stod(nmea.at(6)) * M_PI / 180. + M_PI / 2;
	  orientation_stamp_ = current_stamp;
	  ROS_INFO("QQ is subscribed.");
	}
	else if (nmea.at(0) == "$PASHR")
	{
	  orientation_time_ = stod(nmea.at(1));
	  roll_ = stod(nmea.at(4)) * M_PI / 180.;
	  pitch_ = -1 * stod(nmea.at(5)) * M_PI / 180.;
	  yaw_ = -1 * stod(nmea.at(2)) * M_PI / 180. + M_PI / 2;
	  ROS_INFO("PASHR is subscribed.");
	}
	else*/ /*if(nmea.at(0).compare(3, 3, "GGA") == 0)
	{
	  position_time_ = stod(nmea.at(1));
	  double lat = stod(nmea.at(2)); std::cout << "ggalat : " << std::setprecision(16) << lat << std::endl;
	  double lon = stod(nmea.at(4)); std::cout << "ggalon : " << std::setprecision(16) << lon << std::endl;
	  double h = stod(nmea.at(9)); std::cout << "ggah : " << std::setprecision(16) << h << std::endl;
	  geo_.set_llh_nmea_degrees(lat, lon, h);
	  //if(writeCou == 1)
	  //{
	  //  writebuf << "geo,gpgga," << std::setprecision(16) << geo_.x() << "," << geo_.y() << "," << geo_.z() << std::endl;
	  //  writeCou = 2;
	  //}
	  double fai = gphdt_value;
	  const double earth_R = 6.3781E6;
	  const double ant_distance = 1.28;
	  double lat2 = (ant_distance*cos(fai))/earth_R+lat;
	  double lon2 = (ant_distance*sin(fai))/earth_R+lon;
	  geo2_.set_llh_nmea_degrees(lat2, lon2, h);
	  ROS_INFO("GGA is subscribed.");
	}*/
		/*else if(nmea.at(0) == "$GPRMC")
	{
	  position_time_ = stoi(nmea.at(1));
	  double lat = stod(nmea.at(3));
	  double lon = stod(nmea.at(5));
	  double h = 0.0;
	  geo_.set_llh_nmea_degrees(lat, lon, h);
	  ROS_INFO("GPRMC is subscribed.");
	}*/
		/*else if(nmea.at(0) == "$GPVTG")
	{
	  surface_speed_ = stod(nmea.at(7))/3.6;
	  ROS_INFO("GPVGT is subscribed.");
	}*/
		/*else if(nmea.at(0) == "$GPHDT")
	{
	  double val=stod(nmea.at(1));
	  std::cout << "hdt : " << std::setprecision(16) << val << std::endl;
	  while(val <0 || val >=360){
		if(val<0) val+=360;
		else if(val>=360) val-=360;
	  }std::cout << "hdt : "<< val << std::endl;
	  gphdt_value = val*M_PI/180.0;
	  ROS_INFO("GPHDT is subscribed.");
	}
	/*else if(nmea.at(0) == "$GPGST")
	{
		lat_std = stod(nmea.at(6)); std::cout << "gpgst : " << std::setprecision(16) << lat_std << std::endl;
		lon_std = stod(nmea.at(7));
		alt_std = stod(nmea.at(8));
		ROS_INFO("GPGST is subscribed.");
	}*/
		/*else if(nmea.at(0) == "#BESTGNSSPOSA")
	{
		//std::cout << "aaa : " << nmea.at(16) << std::endl;
		double lat = degrees_minutes_seconds(stod(nmea.at(11))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
		double lon = degrees_minutes_seconds(stod(nmea.at(12))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
		double h = stod(nmea.at(13)); std::cout << "h : " << std::setprecision(16) << h << std::endl;
		geo_.set_llh_nmea_degrees(lat, lon, h);
		writebuf.str(""); // バッファをクリアする。
		writebuf.clear(std::stringstream::goodbit);
		writeCou = 1;
		writebuf << "geo,bestgnsspos," << std::setprecision(16) << geo_.x() << "," << geo_.y() << "," << geo_.z() << std::endl;
		double fai = gphdt_value;
		const double earth_R = 6.3781E6;
		const double ant_distance = 1.28;
		double lat2 = (ant_distance*cos(fai))/earth_R+lat;
		double lon2 = (ant_distance*sin(fai))/earth_R+lon;
		geo2_.set_llh_nmea_degrees(lat2, lon2, h);
		ROS_INFO("BESTGNSSPOS is subscribed.");
	}*/
	if(nmea.at(0) == "#BESTPOSA")
	{
		if(nmea.size() == 30)
		{
			//std::cout << "aaa : " << nmea.at(16) << std::endl;
			double lat = degrees_minutes_seconds(stod(nmea.at(11))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
			double lon = degrees_minutes_seconds(stod(nmea.at(12))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
			double h = stod(nmea.at(13)); std::cout << "h : " << std::setprecision(16) << h << std::endl;
			geo_.set_llh_nmea_degrees(lat, lon, h);
			//if(writeCou == 2)
			//{
			//    writeCou = 0;
			//    writebuf << "geo,bestpos," << std::setprecision(16) << geo_.x() << "," << geo_.y() << "," << geo_.z() << std::endl;
			//    std::cout << writebuf.str();
			//}
			double fai = gphdt_value;
			const double earth_R = 6.3781E6;
			const double ant_distance = 1.28;
			double lat2 = (ant_distance*cos(fai))/earth_R+lat;
			double lon2 = (ant_distance*sin(fai))/earth_R+lon;
			geo2_.set_llh_nmea_degrees(lat2, lon2, h);
			ROS_INFO("BESTGNSSPOS is subscribed.");
		}
	}
	else if(nmea.at(0) == "#INSPVAXA")
	{
		//std::cout << "aaa : " << nmea.at(11) << std::endl;
		//double lat = degrees_minutes_seconds(stod(nmea.at(11))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
		//double lon = degrees_minutes_seconds(stod(nmea.at(12))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
		//double h = stod(nmea.at(13));
		//geo_.set_llh_nmea_degrees(lat, lon, h);

		if(nmea.size() == 32)
		{
			/*double lat = degrees_minutes_seconds(stod(nmea.at(11))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
			double lon = degrees_minutes_seconds(stod(nmea.at(12))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
			double h = stod(nmea.at(13)); std::cout << "h : " << std::setprecision(16) << h << std::endl;
			geo_.set_llh_nmea_degrees(lat, lon, h);*/

			/*double lat = degrees_minutes_seconds(stod(nmea.at(11))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
			double lon = degrees_minutes_seconds(stod(nmea.at(12))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
			double h = stod(nmea.at(13)); std::cout << "h : " << std::setprecision(16) << h << std::endl;*/
			double north_vel = stod(nmea.at(15));
			double east_vel = stod(nmea.at(16));
			double up_vel = stod(nmea.at(17));
			surface_speed_ = sqrt(north_vel*north_vel + east_vel*east_vel + up_vel*up_vel);

			/*double hdt=stod(nmea.at(20));
			std::cout << "insattx : " << std::setprecision(16) << hdt << std::endl;
			while(hdt <0 || hdt >=360){
				if(hdt<0) hdt+=360;
			  else if(hdt>=360) hdt-=360;
			}std::cout << "insattxa : "<< hdt << std::endl;
			gphdt_value = hdt*M_PI/180.0;*/

			//roll_= dig2rad(stod(nmea.at(18)));
			//pitch_= dig2rad(stod(nmea.at(19)));
			yaw_ = dig2rad(stod(nmea.at(20)));

			lat_std = stod(nmea.at(21)); std::cout << "insstdevsa : " << std::setprecision(16) << lat_std << std::endl;
			lon_std = stod(nmea.at(22));
			alt_std = stod(nmea.at(23));

			ROS_INFO("INSPVAXA is subscribed.");
		}
	}
	/*else if(nmea.at(0) == "%INSPVASA")
	{
		//double lat = degrees_minutes_seconds(stod(nmea.at(4))); std::cout << "lat : " << std::setprecision(16) << lat << std::endl;
		//double lon = degrees_minutes_seconds(stod(nmea.at(5))); std::cout << "lon : " << std::setprecision(16) << lon << std::endl;
		//double h = stod(nmea.at(6));
		//geo_.set_llh_nmea_degrees(lat, lon, h);
		double val=stod(nmea.at(12));
		std::cout << "angle : " << std::setprecision(16) << val << std::endl;
		while(val <0 || val >=360){
		  if(val<0) val+=360;
		  else if(val>=360) val-=360;
		}//std::cout << "aaa : "<< val << std::endl;
		gphdt_value = val*M_PI/180.0;
	}*/
	else if(nmea.at(0) == "%INSSTDEVSA")
	{
		std::vector<std::string> str = split(nmea.at(2), ';');
		lat_std = stod(str.at(1)); std::cout << "insstdevsa : " << std::setprecision(16) << lat_std << std::endl;
		lon_std = stod(nmea.at(3));
		alt_std = stod(nmea.at(4));
		ROS_INFO("GPGST is subscribed.");
	}
	else if(nmea.at(0) == "#RAWIMUA")
	{
		if(nmea.size() == 18)
		{
			x_accel_ = stod(nmea.at(14)) * pow(2,-29) * 100;
			y_accel_ = -stod(nmea.at(13)) * pow(2,-29) * 100;
			z_accel_ = stod(nmea.at(12)) * pow(2,-29) * 100;
			y_gyro_ = stod(nmea.at(16)) * pow(2,-33) * 100;
			z_gyro_ = stod(nmea.at(15)) * pow(2,-33) * 100;
			std::vector<std::string> ss = split(nmea[17], '*');
			x_gyro_ = stod(ss.at(0)) * pow(2,-33) * 100;
			ROS_INFO("RAWIMU is subscribed.");
			std::cout << "imu_acc : x," << stod(nmea.at(14)) << " y," << stod(nmea.at(13)) << " z," << stod(nmea.at(12)) << std::endl;
			std::cout << "imu_acc : x," << x_accel_ << " y," << y_accel_ << " z," << z_accel_ << std::endl;
			std::cout << "imu_gyro : x," << stod(nmea.at(17)) << " y," << stod(nmea.at(16)) << " z," << stod(nmea.at(15)) << std::endl;
			std::cout << "imu_gyro : x," << x_gyro_ << " y," << y_gyro_ << " z," << z_gyro_ << std::endl;
		}
	}
  }catch (const std::exception &e)
  {
		ROS_WARN_STREAM("Message is invalid : " << e.what());
  }
}

void Nmea2TFPoseNode::callbackWaypointParam(const autoware_msgs::WaypointParam::ConstPtr &msg)
{
	curve_flag = msg->curve_flag;
}

void Nmea2TFPoseNode::callbackFromNmeaSentence(const nmea_msgs::Sentence::ConstPtr &msg)
{
  current_time_ = msg->header.stamp;
  std::vector<std::string> sentence_split = split(msg->sentence, ',');
  if(sentence_split.size() == 0) return;

  convert(sentence_split, msg->header.stamp);

  double timeout = 10.0;
  if (fabs(orientation_stamp_.toSec() - msg->header.stamp.toSec()) > timeout)
  {
	double dt = sqrt(pow(geo_.x() - last_geo_[0].x(), 2) + pow(geo_.y() - last_geo_[0].y(), 2));
	double threshold = 0.10;
	//if (dt >= threshold)
	{   //std::printf("x:%Lf y:%Lf\n",geo_.x(),geo_.y());
		//std::printf("xl:%Lf yl:%Lf\n",last_geo_.x(),last_geo_.y());
		//std::printf("xs:%Lf ys:%Lf yaw:%Lf\n",geo_.x() - last_geo_.x(),geo_.y() - last_geo_.y(),atan2((double)geo_.x() - (double)last_geo_.x(), (double)geo_.y() - (double)last_geo_.y()));
		//std::cout<<"x:"<<geo_.x()<<" y:"<<geo_.y()<<std::endl;
		//std::cout<<"xl:"<<last_geo_.x()<<" yl:"<<last_geo_.y()<<std::endl;
		//std::cout<<"xs:"<<geo_.x() - last_geo_.x()<<" ys:"<<geo_.y() - last_geo_.y()<<" yaw:"<<atan2(geo_.x() - last_geo_.x(), geo_.y() - last_geo_.y())<<std::endl;
		ROS_INFO("QQ is not subscribed. Orientation is created by atan2");
		last_geo_.push_back(geo_,lat_std,lon_std,alt_std,surface_speed_,yaw_);
		createOrientation();
		if(sentence_split.at(0) == "#BESTPOSA")
		{
			publishPoseStamped();
			publishTF();
		}
		//last_geo_ = geo_;
	}
	/*}else
	{
		createOrientation();
		publishPoseStamped();
		publishTF();
	}*/
	return;
  }

  double e = 1e-2;
  if (fabs(orientation_time_ - position_time_) < e)
  {
	publishPoseStamped();
	publishTF();
	return;
  }
}

std::vector<std::string> split(const std::string &string, const char sep)
{
  std::vector<std::string> str_vec_ptr;
  std::string token;
  std::stringstream ss(string);

  while (getline(ss, token, sep))
	str_vec_ptr.push_back(token);

  return str_vec_ptr;
}

}  // gnss_localize
