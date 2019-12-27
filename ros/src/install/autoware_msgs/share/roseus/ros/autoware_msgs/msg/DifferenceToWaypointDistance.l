;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::DifferenceToWaypointDistance)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'DifferenceToWaypointDistance (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::DIFFERENCETOWAYPOINTDISTANCE")
  (make-package "AUTOWARE_MSGS::DIFFERENCETOWAYPOINTDISTANCE"))

(in-package "ROS")
;;//! \htmlinclude DifferenceToWaypointDistance.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::DifferenceToWaypointDistance
  :super ros::object
  :slots (_header _distance _angular ))

(defmethod autoware_msgs::DifferenceToWaypointDistance
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:distance __distance) 0.0)
    ((:angular __angular) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _distance (float __distance))
   (setq _angular (float __angular))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:angular
   (&optional __angular)
   (if __angular (setq _angular __angular)) _angular)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _distance
    8
    ;; float64 _angular
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular
       (sys::poke _angular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular
     (setq _angular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_msgs::DifferenceToWaypointDistance :md5sum-) "22ae3b6d388334cdc987fffb0f35ae61")
(setf (get autoware_msgs::DifferenceToWaypointDistance :datatype-) "autoware_msgs/DifferenceToWaypointDistance")
(setf (get autoware_msgs::DifferenceToWaypointDistance :definition-)
      "Header header
float64 distance
float64 angular

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



(provide :autoware_msgs/DifferenceToWaypointDistance "22ae3b6d388334cdc987fffb0f35ae61")


