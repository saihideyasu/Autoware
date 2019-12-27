;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigTemporaryStopper)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigTemporaryStopper (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGTEMPORARYSTOPPER")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGTEMPORARYSTOPPER"))

(in-package "ROS")
;;//! \htmlinclude ConfigTemporaryStopper.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigTemporaryStopper
  :super ros::object
  :slots (_header _search_distance _acceleration _number_of_zeros_ahead _number_of_zeros_behind _stop_speed_threshold ))

(defmethod autoware_config_msgs::ConfigTemporaryStopper
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:search_distance __search_distance) 0.0)
    ((:acceleration __acceleration) 0.0)
    ((:number_of_zeros_ahead __number_of_zeros_ahead) 0)
    ((:number_of_zeros_behind __number_of_zeros_behind) 0)
    ((:stop_speed_threshold __stop_speed_threshold) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _search_distance (float __search_distance))
   (setq _acceleration (float __acceleration))
   (setq _number_of_zeros_ahead (round __number_of_zeros_ahead))
   (setq _number_of_zeros_behind (round __number_of_zeros_behind))
   (setq _stop_speed_threshold (float __stop_speed_threshold))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:search_distance
   (&optional __search_distance)
   (if __search_distance (setq _search_distance __search_distance)) _search_distance)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:number_of_zeros_ahead
   (&optional __number_of_zeros_ahead)
   (if __number_of_zeros_ahead (setq _number_of_zeros_ahead __number_of_zeros_ahead)) _number_of_zeros_ahead)
  (:number_of_zeros_behind
   (&optional __number_of_zeros_behind)
   (if __number_of_zeros_behind (setq _number_of_zeros_behind __number_of_zeros_behind)) _number_of_zeros_behind)
  (:stop_speed_threshold
   (&optional __stop_speed_threshold)
   (if __stop_speed_threshold (setq _stop_speed_threshold __stop_speed_threshold)) _stop_speed_threshold)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _search_distance
    4
    ;; float32 _acceleration
    4
    ;; int32 _number_of_zeros_ahead
    4
    ;; int32 _number_of_zeros_behind
    4
    ;; float64 _stop_speed_threshold
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _search_distance
       (sys::poke _search_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _number_of_zeros_ahead
       (write-long _number_of_zeros_ahead s)
     ;; int32 _number_of_zeros_behind
       (write-long _number_of_zeros_behind s)
     ;; float64 _stop_speed_threshold
       (sys::poke _stop_speed_threshold (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _search_distance
     (setq _search_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _acceleration
     (setq _acceleration (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _number_of_zeros_ahead
     (setq _number_of_zeros_ahead (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _number_of_zeros_behind
     (setq _number_of_zeros_behind (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _stop_speed_threshold
     (setq _stop_speed_threshold (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigTemporaryStopper :md5sum-) "539a543caae5914ad6ee1ae5741c9991")
(setf (get autoware_config_msgs::ConfigTemporaryStopper :datatype-) "autoware_config_msgs/ConfigTemporaryStopper")
(setf (get autoware_config_msgs::ConfigTemporaryStopper :definition-)
      "Header header
float32 search_distance
float32 acceleration
int32 number_of_zeros_ahead
int32 number_of_zeros_behind
float64 stop_speed_threshold

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



(provide :autoware_config_msgs/ConfigTemporaryStopper "539a543caae5914ad6ee1ae5741c9991")


