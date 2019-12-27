;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::LiesseXZB70MParam)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'LiesseXZB70MParam (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM")
  (make-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))

(in-package "ROS")
;;//! \htmlinclude LiesseXZB70MParam.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*SHIFT_P*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_P* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_P* 0)
(intern "*SHIFT_R*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_R* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_R* 1)
(intern "*SHIFT_N*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_N* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_N* 2)
(intern "*SHIFT_D*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_D* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_D* 3)
(intern "*SHIFT_4*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_4* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_4* 4)
(intern "*SHIFT_L*" (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(shadow '*SHIFT_L* (find-package "AUTOWARE_MSGS::LIESSEXZB70MPARAM"))
(defconstant autoware_msgs::LiesseXZB70MParam::*SHIFT_L* 5)
(defclass autoware_msgs::LiesseXZB70MParam
  :super ros::object
  :slots (_header _shift ))

(defmethod autoware_msgs::LiesseXZB70MParam
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:shift __shift) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _shift (round __shift))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:shift
   (&optional __shift)
   (if __shift (setq _shift __shift)) _shift)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int8 _shift
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int8 _shift
       (write-byte _shift s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int8 _shift
     (setq _shift (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _shift 127) (setq _shift (- _shift 256)))
   ;;
   self)
  )

(setf (get autoware_msgs::LiesseXZB70MParam :md5sum-) "299d9ca4a0f481002204559fa398d19d")
(setf (get autoware_msgs::LiesseXZB70MParam :datatype-) "autoware_msgs/LiesseXZB70MParam")
(setf (get autoware_msgs::LiesseXZB70MParam :definition-)
      "Header header
int8 SHIFT_P = 0
int8 SHIFT_R = 1
int8 SHIFT_N = 2
int8 SHIFT_D = 3
int8 SHIFT_4 = 4
int8 SHIFT_L = 5
int8 shift

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



(provide :autoware_msgs/LiesseXZB70MParam "299d9ca4a0f481002204559fa398d19d")


