;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigMicrobusInterface)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigMicrobusInterface (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGMICROBUSINTERFACE")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGMICROBUSINTERFACE"))

(in-package "ROS")
;;//! \htmlinclude ConfigMicrobusInterface.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigMicrobusInterface
  :super ros::object
  :slots (_header _check_distance_th _check_angular_th ))

(defmethod autoware_config_msgs::ConfigMicrobusInterface
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:check_distance_th __check_distance_th) 0.0)
    ((:check_angular_th __check_angular_th) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _check_distance_th (float __check_distance_th))
   (setq _check_angular_th (float __check_angular_th))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:check_distance_th
   (&optional __check_distance_th)
   (if __check_distance_th (setq _check_distance_th __check_distance_th)) _check_distance_th)
  (:check_angular_th
   (&optional __check_angular_th)
   (if __check_angular_th (setq _check_angular_th __check_angular_th)) _check_angular_th)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _check_distance_th
    8
    ;; float64 _check_angular_th
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _check_distance_th
       (sys::poke _check_distance_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _check_angular_th
       (sys::poke _check_angular_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _check_distance_th
     (setq _check_distance_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _check_angular_th
     (setq _check_angular_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigMicrobusInterface :md5sum-) "49c0dc484a02daa8ec01ed5e3ccd0ed6")
(setf (get autoware_config_msgs::ConfigMicrobusInterface :datatype-) "autoware_config_msgs/ConfigMicrobusInterface")
(setf (get autoware_config_msgs::ConfigMicrobusInterface :definition-)
      "Header header
float64 check_distance_th
float64 check_angular_th

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



(provide :autoware_config_msgs/ConfigMicrobusInterface "49c0dc484a02daa8ec01ed5e3ccd0ed6")


