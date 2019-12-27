;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::PositionChecker)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'PositionChecker (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::POSITIONCHECKER")
  (make-package "AUTOWARE_MSGS::POSITIONCHECKER"))

(in-package "ROS")
;;//! \htmlinclude PositionChecker.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::PositionChecker
  :super ros::object
  :slots (_header _stop_flag ))

(defmethod autoware_msgs::PositionChecker
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:stop_flag __stop_flag) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _stop_flag (round __stop_flag))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:stop_flag
   (&optional __stop_flag)
   (if __stop_flag (setq _stop_flag __stop_flag)) _stop_flag)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _stop_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _stop_flag
       (write-byte _stop_flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _stop_flag
     (setq _stop_flag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get autoware_msgs::PositionChecker :md5sum-) "11c5390e6a4faae76625ae9d933f0b42")
(setf (get autoware_msgs::PositionChecker :datatype-) "autoware_msgs/PositionChecker")
(setf (get autoware_msgs::PositionChecker :definition-)
      "Header header
uint8 stop_flag

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



(provide :autoware_msgs/PositionChecker "11c5390e6a4faae76625ae9d933f0b42")


