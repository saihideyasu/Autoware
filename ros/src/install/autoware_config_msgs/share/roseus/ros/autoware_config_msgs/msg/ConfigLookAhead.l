;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigLookAhead)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigLookAhead (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGLOOKAHEAD")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGLOOKAHEAD"))

(in-package "ROS")
;;//! \htmlinclude ConfigLookAhead.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigLookAhead
  :super ros::object
  :slots (_header _lookahead_ratio _minimum_lookahead_distance ))

(defmethod autoware_config_msgs::ConfigLookAhead
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lookahead_ratio __lookahead_ratio) 0.0)
    ((:minimum_lookahead_distance __minimum_lookahead_distance) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lookahead_ratio (float __lookahead_ratio))
   (setq _minimum_lookahead_distance (float __minimum_lookahead_distance))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lookahead_ratio
   (&optional __lookahead_ratio)
   (if __lookahead_ratio (setq _lookahead_ratio __lookahead_ratio)) _lookahead_ratio)
  (:minimum_lookahead_distance
   (&optional __minimum_lookahead_distance)
   (if __minimum_lookahead_distance (setq _minimum_lookahead_distance __minimum_lookahead_distance)) _minimum_lookahead_distance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _lookahead_ratio
    4
    ;; float32 _minimum_lookahead_distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _lookahead_ratio
       (sys::poke _lookahead_ratio (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _minimum_lookahead_distance
       (sys::poke _minimum_lookahead_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _lookahead_ratio
     (setq _lookahead_ratio (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _minimum_lookahead_distance
     (setq _minimum_lookahead_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigLookAhead :md5sum-) "a0bcfee04f0b9a358f42c214f234df83")
(setf (get autoware_config_msgs::ConfigLookAhead :datatype-) "autoware_config_msgs/ConfigLookAhead")
(setf (get autoware_config_msgs::ConfigLookAhead :definition-)
      "Header header
float32 lookahead_ratio
float32 minimum_lookahead_distance

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



(provide :autoware_config_msgs/ConfigLookAhead "a0bcfee04f0b9a358f42c214f234df83")


