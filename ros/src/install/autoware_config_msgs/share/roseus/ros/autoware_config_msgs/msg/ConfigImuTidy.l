;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigImuTidy)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigImuTidy (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGIMUTIDY")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGIMUTIDY"))

(in-package "ROS")
;;//! \htmlinclude ConfigImuTidy.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigImuTidy
  :super ros::object
  :slots (_header _lowpass_filter_weight ))

(defmethod autoware_config_msgs::ConfigImuTidy
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lowpass_filter_weight __lowpass_filter_weight) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lowpass_filter_weight (float __lowpass_filter_weight))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lowpass_filter_weight
   (&optional __lowpass_filter_weight)
   (if __lowpass_filter_weight (setq _lowpass_filter_weight __lowpass_filter_weight)) _lowpass_filter_weight)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _lowpass_filter_weight
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _lowpass_filter_weight
       (sys::poke _lowpass_filter_weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _lowpass_filter_weight
     (setq _lowpass_filter_weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigImuTidy :md5sum-) "476d31d2c910cd7236e351b47ec67fcd")
(setf (get autoware_config_msgs::ConfigImuTidy :datatype-) "autoware_config_msgs/ConfigImuTidy")
(setf (get autoware_config_msgs::ConfigImuTidy :definition-)
      "Header header
float64 lowpass_filter_weight

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



(provide :autoware_config_msgs/ConfigImuTidy "476d31d2c910cd7236e351b47ec67fcd")


