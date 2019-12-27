;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::GnssSurfaceSpeed)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'GnssSurfaceSpeed (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::GNSSSURFACESPEED")
  (make-package "AUTOWARE_MSGS::GNSSSURFACESPEED"))

(in-package "ROS")
;;//! \htmlinclude GnssSurfaceSpeed.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::GnssSurfaceSpeed
  :super ros::object
  :slots (_header _surface_speed ))

(defmethod autoware_msgs::GnssSurfaceSpeed
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:surface_speed __surface_speed) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _surface_speed (float __surface_speed))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:surface_speed
   (&optional __surface_speed)
   (if __surface_speed (setq _surface_speed __surface_speed)) _surface_speed)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _surface_speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _surface_speed
       (sys::poke _surface_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _surface_speed
     (setq _surface_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_msgs::GnssSurfaceSpeed :md5sum-) "7301732f40a4f47fa1581fe38cd4143d")
(setf (get autoware_msgs::GnssSurfaceSpeed :datatype-) "autoware_msgs/GnssSurfaceSpeed")
(setf (get autoware_msgs::GnssSurfaceSpeed :definition-)
      "Header header
float64 surface_speed

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



(provide :autoware_msgs/GnssSurfaceSpeed "7301732f40a4f47fa1581fe38cd4143d")


