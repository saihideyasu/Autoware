;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigMicroBusCan)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigMicroBusCan (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGMICROBUSCAN")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGMICROBUSCAN"))

(in-package "ROS")
;;//! \htmlinclude ConfigMicroBusCan.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigMicroBusCan
  :super ros::object
  :slots (_header _use_position_checker _velocity_limit _velocity_stop_th _accel_max_i _brake_max_i _k_accel_p_velocity _k_accel_i_velocity _k_accel_d_velocity _k_brake_p_velocity _k_brake_i_velocity _k_brake_d_velocity _k_accel_p_acceleration _k_accel_i_acceleration _k_accel_d_acceleration _k_brake_p_acceleration _k_brake_i_acceleration _k_brake_d_acceleration _k_accel_p_distance _k_accel_i_distance _k_accel_d_distance _k_brake_p_distance _k_brake_i_distance _k_brake_d_distance _steer_max_i _k_steer_p_distance _k_steer_i_distance _k_steer_d_distance _pedal_stroke_center _pedal_stroke_max _pedal_stroke_min _brake_stroke_stopping_med _accel_stroke_offset _brake_stroke_offset _gnss_lat_limit _gnss_lon_limit _gnss_alt_limit _acceptable_velocity_variation _difference_to_waypoint_distance _difference_to_waypoint_angular ))

(defmethod autoware_config_msgs::ConfigMicroBusCan
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:use_position_checker __use_position_checker) nil)
    ((:velocity_limit __velocity_limit) 0.0)
    ((:velocity_stop_th __velocity_stop_th) 0.0)
    ((:accel_max_i __accel_max_i) 0.0)
    ((:brake_max_i __brake_max_i) 0.0)
    ((:k_accel_p_velocity __k_accel_p_velocity) 0.0)
    ((:k_accel_i_velocity __k_accel_i_velocity) 0.0)
    ((:k_accel_d_velocity __k_accel_d_velocity) 0.0)
    ((:k_brake_p_velocity __k_brake_p_velocity) 0.0)
    ((:k_brake_i_velocity __k_brake_i_velocity) 0.0)
    ((:k_brake_d_velocity __k_brake_d_velocity) 0.0)
    ((:k_accel_p_acceleration __k_accel_p_acceleration) 0.0)
    ((:k_accel_i_acceleration __k_accel_i_acceleration) 0.0)
    ((:k_accel_d_acceleration __k_accel_d_acceleration) 0.0)
    ((:k_brake_p_acceleration __k_brake_p_acceleration) 0.0)
    ((:k_brake_i_acceleration __k_brake_i_acceleration) 0.0)
    ((:k_brake_d_acceleration __k_brake_d_acceleration) 0.0)
    ((:k_accel_p_distance __k_accel_p_distance) 0.0)
    ((:k_accel_i_distance __k_accel_i_distance) 0.0)
    ((:k_accel_d_distance __k_accel_d_distance) 0.0)
    ((:k_brake_p_distance __k_brake_p_distance) 0.0)
    ((:k_brake_i_distance __k_brake_i_distance) 0.0)
    ((:k_brake_d_distance __k_brake_d_distance) 0.0)
    ((:steer_max_i __steer_max_i) 0.0)
    ((:k_steer_p_distance __k_steer_p_distance) 0.0)
    ((:k_steer_i_distance __k_steer_i_distance) 0.0)
    ((:k_steer_d_distance __k_steer_d_distance) 0.0)
    ((:pedal_stroke_center __pedal_stroke_center) 0)
    ((:pedal_stroke_max __pedal_stroke_max) 0)
    ((:pedal_stroke_min __pedal_stroke_min) 0)
    ((:brake_stroke_stopping_med __brake_stroke_stopping_med) 0)
    ((:accel_stroke_offset __accel_stroke_offset) 0)
    ((:brake_stroke_offset __brake_stroke_offset) 0)
    ((:gnss_lat_limit __gnss_lat_limit) 0.0)
    ((:gnss_lon_limit __gnss_lon_limit) 0.0)
    ((:gnss_alt_limit __gnss_alt_limit) 0.0)
    ((:acceptable_velocity_variation __acceptable_velocity_variation) 0.0)
    ((:difference_to_waypoint_distance __difference_to_waypoint_distance) 0.0)
    ((:difference_to_waypoint_angular __difference_to_waypoint_angular) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _use_position_checker __use_position_checker)
   (setq _velocity_limit (float __velocity_limit))
   (setq _velocity_stop_th (float __velocity_stop_th))
   (setq _accel_max_i (float __accel_max_i))
   (setq _brake_max_i (float __brake_max_i))
   (setq _k_accel_p_velocity (float __k_accel_p_velocity))
   (setq _k_accel_i_velocity (float __k_accel_i_velocity))
   (setq _k_accel_d_velocity (float __k_accel_d_velocity))
   (setq _k_brake_p_velocity (float __k_brake_p_velocity))
   (setq _k_brake_i_velocity (float __k_brake_i_velocity))
   (setq _k_brake_d_velocity (float __k_brake_d_velocity))
   (setq _k_accel_p_acceleration (float __k_accel_p_acceleration))
   (setq _k_accel_i_acceleration (float __k_accel_i_acceleration))
   (setq _k_accel_d_acceleration (float __k_accel_d_acceleration))
   (setq _k_brake_p_acceleration (float __k_brake_p_acceleration))
   (setq _k_brake_i_acceleration (float __k_brake_i_acceleration))
   (setq _k_brake_d_acceleration (float __k_brake_d_acceleration))
   (setq _k_accel_p_distance (float __k_accel_p_distance))
   (setq _k_accel_i_distance (float __k_accel_i_distance))
   (setq _k_accel_d_distance (float __k_accel_d_distance))
   (setq _k_brake_p_distance (float __k_brake_p_distance))
   (setq _k_brake_i_distance (float __k_brake_i_distance))
   (setq _k_brake_d_distance (float __k_brake_d_distance))
   (setq _steer_max_i (float __steer_max_i))
   (setq _k_steer_p_distance (float __k_steer_p_distance))
   (setq _k_steer_i_distance (float __k_steer_i_distance))
   (setq _k_steer_d_distance (float __k_steer_d_distance))
   (setq _pedal_stroke_center (round __pedal_stroke_center))
   (setq _pedal_stroke_max (round __pedal_stroke_max))
   (setq _pedal_stroke_min (round __pedal_stroke_min))
   (setq _brake_stroke_stopping_med (round __brake_stroke_stopping_med))
   (setq _accel_stroke_offset (round __accel_stroke_offset))
   (setq _brake_stroke_offset (round __brake_stroke_offset))
   (setq _gnss_lat_limit (float __gnss_lat_limit))
   (setq _gnss_lon_limit (float __gnss_lon_limit))
   (setq _gnss_alt_limit (float __gnss_alt_limit))
   (setq _acceptable_velocity_variation (float __acceptable_velocity_variation))
   (setq _difference_to_waypoint_distance (float __difference_to_waypoint_distance))
   (setq _difference_to_waypoint_angular (float __difference_to_waypoint_angular))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:use_position_checker
   (&optional __use_position_checker)
   (if __use_position_checker (setq _use_position_checker __use_position_checker)) _use_position_checker)
  (:velocity_limit
   (&optional __velocity_limit)
   (if __velocity_limit (setq _velocity_limit __velocity_limit)) _velocity_limit)
  (:velocity_stop_th
   (&optional __velocity_stop_th)
   (if __velocity_stop_th (setq _velocity_stop_th __velocity_stop_th)) _velocity_stop_th)
  (:accel_max_i
   (&optional __accel_max_i)
   (if __accel_max_i (setq _accel_max_i __accel_max_i)) _accel_max_i)
  (:brake_max_i
   (&optional __brake_max_i)
   (if __brake_max_i (setq _brake_max_i __brake_max_i)) _brake_max_i)
  (:k_accel_p_velocity
   (&optional __k_accel_p_velocity)
   (if __k_accel_p_velocity (setq _k_accel_p_velocity __k_accel_p_velocity)) _k_accel_p_velocity)
  (:k_accel_i_velocity
   (&optional __k_accel_i_velocity)
   (if __k_accel_i_velocity (setq _k_accel_i_velocity __k_accel_i_velocity)) _k_accel_i_velocity)
  (:k_accel_d_velocity
   (&optional __k_accel_d_velocity)
   (if __k_accel_d_velocity (setq _k_accel_d_velocity __k_accel_d_velocity)) _k_accel_d_velocity)
  (:k_brake_p_velocity
   (&optional __k_brake_p_velocity)
   (if __k_brake_p_velocity (setq _k_brake_p_velocity __k_brake_p_velocity)) _k_brake_p_velocity)
  (:k_brake_i_velocity
   (&optional __k_brake_i_velocity)
   (if __k_brake_i_velocity (setq _k_brake_i_velocity __k_brake_i_velocity)) _k_brake_i_velocity)
  (:k_brake_d_velocity
   (&optional __k_brake_d_velocity)
   (if __k_brake_d_velocity (setq _k_brake_d_velocity __k_brake_d_velocity)) _k_brake_d_velocity)
  (:k_accel_p_acceleration
   (&optional __k_accel_p_acceleration)
   (if __k_accel_p_acceleration (setq _k_accel_p_acceleration __k_accel_p_acceleration)) _k_accel_p_acceleration)
  (:k_accel_i_acceleration
   (&optional __k_accel_i_acceleration)
   (if __k_accel_i_acceleration (setq _k_accel_i_acceleration __k_accel_i_acceleration)) _k_accel_i_acceleration)
  (:k_accel_d_acceleration
   (&optional __k_accel_d_acceleration)
   (if __k_accel_d_acceleration (setq _k_accel_d_acceleration __k_accel_d_acceleration)) _k_accel_d_acceleration)
  (:k_brake_p_acceleration
   (&optional __k_brake_p_acceleration)
   (if __k_brake_p_acceleration (setq _k_brake_p_acceleration __k_brake_p_acceleration)) _k_brake_p_acceleration)
  (:k_brake_i_acceleration
   (&optional __k_brake_i_acceleration)
   (if __k_brake_i_acceleration (setq _k_brake_i_acceleration __k_brake_i_acceleration)) _k_brake_i_acceleration)
  (:k_brake_d_acceleration
   (&optional __k_brake_d_acceleration)
   (if __k_brake_d_acceleration (setq _k_brake_d_acceleration __k_brake_d_acceleration)) _k_brake_d_acceleration)
  (:k_accel_p_distance
   (&optional __k_accel_p_distance)
   (if __k_accel_p_distance (setq _k_accel_p_distance __k_accel_p_distance)) _k_accel_p_distance)
  (:k_accel_i_distance
   (&optional __k_accel_i_distance)
   (if __k_accel_i_distance (setq _k_accel_i_distance __k_accel_i_distance)) _k_accel_i_distance)
  (:k_accel_d_distance
   (&optional __k_accel_d_distance)
   (if __k_accel_d_distance (setq _k_accel_d_distance __k_accel_d_distance)) _k_accel_d_distance)
  (:k_brake_p_distance
   (&optional __k_brake_p_distance)
   (if __k_brake_p_distance (setq _k_brake_p_distance __k_brake_p_distance)) _k_brake_p_distance)
  (:k_brake_i_distance
   (&optional __k_brake_i_distance)
   (if __k_brake_i_distance (setq _k_brake_i_distance __k_brake_i_distance)) _k_brake_i_distance)
  (:k_brake_d_distance
   (&optional __k_brake_d_distance)
   (if __k_brake_d_distance (setq _k_brake_d_distance __k_brake_d_distance)) _k_brake_d_distance)
  (:steer_max_i
   (&optional __steer_max_i)
   (if __steer_max_i (setq _steer_max_i __steer_max_i)) _steer_max_i)
  (:k_steer_p_distance
   (&optional __k_steer_p_distance)
   (if __k_steer_p_distance (setq _k_steer_p_distance __k_steer_p_distance)) _k_steer_p_distance)
  (:k_steer_i_distance
   (&optional __k_steer_i_distance)
   (if __k_steer_i_distance (setq _k_steer_i_distance __k_steer_i_distance)) _k_steer_i_distance)
  (:k_steer_d_distance
   (&optional __k_steer_d_distance)
   (if __k_steer_d_distance (setq _k_steer_d_distance __k_steer_d_distance)) _k_steer_d_distance)
  (:pedal_stroke_center
   (&optional __pedal_stroke_center)
   (if __pedal_stroke_center (setq _pedal_stroke_center __pedal_stroke_center)) _pedal_stroke_center)
  (:pedal_stroke_max
   (&optional __pedal_stroke_max)
   (if __pedal_stroke_max (setq _pedal_stroke_max __pedal_stroke_max)) _pedal_stroke_max)
  (:pedal_stroke_min
   (&optional __pedal_stroke_min)
   (if __pedal_stroke_min (setq _pedal_stroke_min __pedal_stroke_min)) _pedal_stroke_min)
  (:brake_stroke_stopping_med
   (&optional __brake_stroke_stopping_med)
   (if __brake_stroke_stopping_med (setq _brake_stroke_stopping_med __brake_stroke_stopping_med)) _brake_stroke_stopping_med)
  (:accel_stroke_offset
   (&optional __accel_stroke_offset)
   (if __accel_stroke_offset (setq _accel_stroke_offset __accel_stroke_offset)) _accel_stroke_offset)
  (:brake_stroke_offset
   (&optional __brake_stroke_offset)
   (if __brake_stroke_offset (setq _brake_stroke_offset __brake_stroke_offset)) _brake_stroke_offset)
  (:gnss_lat_limit
   (&optional __gnss_lat_limit)
   (if __gnss_lat_limit (setq _gnss_lat_limit __gnss_lat_limit)) _gnss_lat_limit)
  (:gnss_lon_limit
   (&optional __gnss_lon_limit)
   (if __gnss_lon_limit (setq _gnss_lon_limit __gnss_lon_limit)) _gnss_lon_limit)
  (:gnss_alt_limit
   (&optional __gnss_alt_limit)
   (if __gnss_alt_limit (setq _gnss_alt_limit __gnss_alt_limit)) _gnss_alt_limit)
  (:acceptable_velocity_variation
   (&optional __acceptable_velocity_variation)
   (if __acceptable_velocity_variation (setq _acceptable_velocity_variation __acceptable_velocity_variation)) _acceptable_velocity_variation)
  (:difference_to_waypoint_distance
   (&optional __difference_to_waypoint_distance)
   (if __difference_to_waypoint_distance (setq _difference_to_waypoint_distance __difference_to_waypoint_distance)) _difference_to_waypoint_distance)
  (:difference_to_waypoint_angular
   (&optional __difference_to_waypoint_angular)
   (if __difference_to_waypoint_angular (setq _difference_to_waypoint_angular __difference_to_waypoint_angular)) _difference_to_waypoint_angular)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _use_position_checker
    1
    ;; float64 _velocity_limit
    8
    ;; float64 _velocity_stop_th
    8
    ;; float64 _accel_max_i
    8
    ;; float64 _brake_max_i
    8
    ;; float64 _k_accel_p_velocity
    8
    ;; float64 _k_accel_i_velocity
    8
    ;; float64 _k_accel_d_velocity
    8
    ;; float64 _k_brake_p_velocity
    8
    ;; float64 _k_brake_i_velocity
    8
    ;; float64 _k_brake_d_velocity
    8
    ;; float64 _k_accel_p_acceleration
    8
    ;; float64 _k_accel_i_acceleration
    8
    ;; float64 _k_accel_d_acceleration
    8
    ;; float64 _k_brake_p_acceleration
    8
    ;; float64 _k_brake_i_acceleration
    8
    ;; float64 _k_brake_d_acceleration
    8
    ;; float64 _k_accel_p_distance
    8
    ;; float64 _k_accel_i_distance
    8
    ;; float64 _k_accel_d_distance
    8
    ;; float64 _k_brake_p_distance
    8
    ;; float64 _k_brake_i_distance
    8
    ;; float64 _k_brake_d_distance
    8
    ;; float64 _steer_max_i
    8
    ;; float64 _k_steer_p_distance
    8
    ;; float64 _k_steer_i_distance
    8
    ;; float64 _k_steer_d_distance
    8
    ;; int16 _pedal_stroke_center
    2
    ;; int16 _pedal_stroke_max
    2
    ;; int16 _pedal_stroke_min
    2
    ;; int16 _brake_stroke_stopping_med
    2
    ;; int16 _accel_stroke_offset
    2
    ;; int16 _brake_stroke_offset
    2
    ;; float64 _gnss_lat_limit
    8
    ;; float64 _gnss_lon_limit
    8
    ;; float64 _gnss_alt_limit
    8
    ;; float64 _acceptable_velocity_variation
    8
    ;; float64 _difference_to_waypoint_distance
    8
    ;; float64 _difference_to_waypoint_angular
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _use_position_checker
       (if _use_position_checker (write-byte -1 s) (write-byte 0 s))
     ;; float64 _velocity_limit
       (sys::poke _velocity_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity_stop_th
       (sys::poke _velocity_stop_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _accel_max_i
       (sys::poke _accel_max_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake_max_i
       (sys::poke _brake_max_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_p_velocity
       (sys::poke _k_accel_p_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_i_velocity
       (sys::poke _k_accel_i_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_d_velocity
       (sys::poke _k_accel_d_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_p_velocity
       (sys::poke _k_brake_p_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_i_velocity
       (sys::poke _k_brake_i_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_d_velocity
       (sys::poke _k_brake_d_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_p_acceleration
       (sys::poke _k_accel_p_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_i_acceleration
       (sys::poke _k_accel_i_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_d_acceleration
       (sys::poke _k_accel_d_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_p_acceleration
       (sys::poke _k_brake_p_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_i_acceleration
       (sys::poke _k_brake_i_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_d_acceleration
       (sys::poke _k_brake_d_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_p_distance
       (sys::poke _k_accel_p_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_i_distance
       (sys::poke _k_accel_i_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_accel_d_distance
       (sys::poke _k_accel_d_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_p_distance
       (sys::poke _k_brake_p_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_i_distance
       (sys::poke _k_brake_i_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_brake_d_distance
       (sys::poke _k_brake_d_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steer_max_i
       (sys::poke _steer_max_i (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_steer_p_distance
       (sys::poke _k_steer_p_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_steer_i_distance
       (sys::poke _k_steer_i_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _k_steer_d_distance
       (sys::poke _k_steer_d_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _pedal_stroke_center
       (write-word _pedal_stroke_center s)
     ;; int16 _pedal_stroke_max
       (write-word _pedal_stroke_max s)
     ;; int16 _pedal_stroke_min
       (write-word _pedal_stroke_min s)
     ;; int16 _brake_stroke_stopping_med
       (write-word _brake_stroke_stopping_med s)
     ;; int16 _accel_stroke_offset
       (write-word _accel_stroke_offset s)
     ;; int16 _brake_stroke_offset
       (write-word _brake_stroke_offset s)
     ;; float64 _gnss_lat_limit
       (sys::poke _gnss_lat_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gnss_lon_limit
       (sys::poke _gnss_lon_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _gnss_alt_limit
       (sys::poke _gnss_alt_limit (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceptable_velocity_variation
       (sys::poke _acceptable_velocity_variation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _difference_to_waypoint_distance
       (sys::poke _difference_to_waypoint_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _difference_to_waypoint_angular
       (sys::poke _difference_to_waypoint_angular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _use_position_checker
     (setq _use_position_checker (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _velocity_limit
     (setq _velocity_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity_stop_th
     (setq _velocity_stop_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _accel_max_i
     (setq _accel_max_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake_max_i
     (setq _brake_max_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_p_velocity
     (setq _k_accel_p_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_i_velocity
     (setq _k_accel_i_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_d_velocity
     (setq _k_accel_d_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_p_velocity
     (setq _k_brake_p_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_i_velocity
     (setq _k_brake_i_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_d_velocity
     (setq _k_brake_d_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_p_acceleration
     (setq _k_accel_p_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_i_acceleration
     (setq _k_accel_i_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_d_acceleration
     (setq _k_accel_d_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_p_acceleration
     (setq _k_brake_p_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_i_acceleration
     (setq _k_brake_i_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_d_acceleration
     (setq _k_brake_d_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_p_distance
     (setq _k_accel_p_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_i_distance
     (setq _k_accel_i_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_accel_d_distance
     (setq _k_accel_d_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_p_distance
     (setq _k_brake_p_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_i_distance
     (setq _k_brake_i_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_brake_d_distance
     (setq _k_brake_d_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steer_max_i
     (setq _steer_max_i (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_steer_p_distance
     (setq _k_steer_p_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_steer_i_distance
     (setq _k_steer_i_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _k_steer_d_distance
     (setq _k_steer_d_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _pedal_stroke_center
     (setq _pedal_stroke_center (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pedal_stroke_max
     (setq _pedal_stroke_max (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pedal_stroke_min
     (setq _pedal_stroke_min (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _brake_stroke_stopping_med
     (setq _brake_stroke_stopping_med (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _accel_stroke_offset
     (setq _accel_stroke_offset (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _brake_stroke_offset
     (setq _brake_stroke_offset (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _gnss_lat_limit
     (setq _gnss_lat_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gnss_lon_limit
     (setq _gnss_lon_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _gnss_alt_limit
     (setq _gnss_alt_limit (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceptable_velocity_variation
     (setq _acceptable_velocity_variation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _difference_to_waypoint_distance
     (setq _difference_to_waypoint_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _difference_to_waypoint_angular
     (setq _difference_to_waypoint_angular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigMicroBusCan :md5sum-) "26c6999f9bd3f4e18f1576c259a99941")
(setf (get autoware_config_msgs::ConfigMicroBusCan :datatype-) "autoware_config_msgs/ConfigMicroBusCan")
(setf (get autoware_config_msgs::ConfigMicroBusCan :definition-)
      "Header header
bool use_position_checker
float64 velocity_limit
float64 velocity_stop_th
float64 accel_max_i
float64 brake_max_i
float64 k_accel_p_velocity
float64 k_accel_i_velocity
float64 k_accel_d_velocity
float64 k_brake_p_velocity
float64 k_brake_i_velocity
float64 k_brake_d_velocity
float64 k_accel_p_acceleration
float64 k_accel_i_acceleration
float64 k_accel_d_acceleration
float64 k_brake_p_acceleration
float64 k_brake_i_acceleration
float64 k_brake_d_acceleration
float64 k_accel_p_distance
float64 k_accel_i_distance
float64 k_accel_d_distance
float64 k_brake_p_distance
float64 k_brake_i_distance
float64 k_brake_d_distance
float64 steer_max_i
float64 k_steer_p_distance
float64 k_steer_i_distance
float64 k_steer_d_distance
int16 pedal_stroke_center
int16 pedal_stroke_max
int16 pedal_stroke_min
int16 brake_stroke_stopping_med
int16 accel_stroke_offset
int16 brake_stroke_offset
float64 gnss_lat_limit
float64 gnss_lon_limit
float64 gnss_alt_limit
float64 acceptable_velocity_variation
float64 difference_to_waypoint_distance
float64 difference_to_waypoint_angular

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :autoware_config_msgs/ConfigMicroBusCan "26c6999f9bd3f4e18f1576c259a99941")


