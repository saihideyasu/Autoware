;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::LinearArray)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'LinearArray (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::LINEARARRAY")
  (make-package "AUTOWARE_MSGS::LINEARARRAY"))

(in-package "ROS")
;;//! \htmlinclude LinearArray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::LinearArray
  :super ros::object
  :slots (_header _linears ))

(defmethod autoware_msgs::LinearArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:linears __linears) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Vector3 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _linears __linears)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:linears
   (&rest __linears)
   (if (keywordp (car __linears))
       (send* _linears __linears)
     (progn
       (if __linears (setq _linears (car __linears)))
       _linears)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3[] _linears
    (apply #'+ (send-all _linears :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3[] _linears
     (write-long (length _linears) s)
     (dolist (elem _linears)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3[] _linears
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _linears (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _linears)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autoware_msgs::LinearArray :md5sum-) "66c0bca42fe9a4af49d1db5257c70354")
(setf (get autoware_msgs::LinearArray :datatype-) "autoware_msgs/LinearArray")
(setf (get autoware_msgs::LinearArray :definition-)
      "Header header
geometry_msgs/Vector3[] linears

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

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :autoware_msgs/LinearArray "66c0bca42fe9a4af49d1db5257c70354")


