;; Auto-generated. Do not edit!


(when (boundp 'autoware_can_msgs::MicroBusCanSenderStatus)
  (if (not (find-package "AUTOWARE_CAN_MSGS"))
    (make-package "AUTOWARE_CAN_MSGS"))
  (shadow 'MicroBusCanSenderStatus (find-package "AUTOWARE_CAN_MSGS")))
(unless (find-package "AUTOWARE_CAN_MSGS::MICROBUSCANSENDERSTATUS")
  (make-package "AUTOWARE_CAN_MSGS::MICROBUSCANSENDERSTATUS"))

(in-package "ROS")
;;//! \htmlinclude MicroBusCanSenderStatus.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_can_msgs::MicroBusCanSenderStatus
  :super ros::object
  :slots (_header _use_position_checker _use_input_steer _use_input_drive _use_velocity_topic _position_check_stop _angle_limit_over _safety_error_message ))

(defmethod autoware_can_msgs::MicroBusCanSenderStatus
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:use_position_checker __use_position_checker) nil)
    ((:use_input_steer __use_input_steer) nil)
    ((:use_input_drive __use_input_drive) nil)
    ((:use_velocity_topic __use_velocity_topic) 0)
    ((:position_check_stop __position_check_stop) nil)
    ((:angle_limit_over __angle_limit_over) nil)
    ((:safety_error_message __safety_error_message) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _use_position_checker __use_position_checker)
   (setq _use_input_steer __use_input_steer)
   (setq _use_input_drive __use_input_drive)
   (setq _use_velocity_topic (round __use_velocity_topic))
   (setq _position_check_stop __position_check_stop)
   (setq _angle_limit_over __angle_limit_over)
   (setq _safety_error_message (string __safety_error_message))
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
  (:use_input_steer
   (&optional __use_input_steer)
   (if __use_input_steer (setq _use_input_steer __use_input_steer)) _use_input_steer)
  (:use_input_drive
   (&optional __use_input_drive)
   (if __use_input_drive (setq _use_input_drive __use_input_drive)) _use_input_drive)
  (:use_velocity_topic
   (&optional __use_velocity_topic)
   (if __use_velocity_topic (setq _use_velocity_topic __use_velocity_topic)) _use_velocity_topic)
  (:position_check_stop
   (&optional __position_check_stop)
   (if __position_check_stop (setq _position_check_stop __position_check_stop)) _position_check_stop)
  (:angle_limit_over
   (&optional __angle_limit_over)
   (if __angle_limit_over (setq _angle_limit_over __angle_limit_over)) _angle_limit_over)
  (:safety_error_message
   (&optional __safety_error_message)
   (if __safety_error_message (setq _safety_error_message __safety_error_message)) _safety_error_message)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _use_position_checker
    1
    ;; bool _use_input_steer
    1
    ;; bool _use_input_drive
    1
    ;; int8 _use_velocity_topic
    1
    ;; bool _position_check_stop
    1
    ;; bool _angle_limit_over
    1
    ;; string _safety_error_message
    4 (length _safety_error_message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _use_position_checker
       (if _use_position_checker (write-byte -1 s) (write-byte 0 s))
     ;; bool _use_input_steer
       (if _use_input_steer (write-byte -1 s) (write-byte 0 s))
     ;; bool _use_input_drive
       (if _use_input_drive (write-byte -1 s) (write-byte 0 s))
     ;; int8 _use_velocity_topic
       (write-byte _use_velocity_topic s)
     ;; bool _position_check_stop
       (if _position_check_stop (write-byte -1 s) (write-byte 0 s))
     ;; bool _angle_limit_over
       (if _angle_limit_over (write-byte -1 s) (write-byte 0 s))
     ;; string _safety_error_message
       (write-long (length _safety_error_message) s) (princ _safety_error_message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _use_position_checker
     (setq _use_position_checker (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _use_input_steer
     (setq _use_input_steer (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _use_input_drive
     (setq _use_input_drive (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _use_velocity_topic
     (setq _use_velocity_topic (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _use_velocity_topic 127) (setq _use_velocity_topic (- _use_velocity_topic 256)))
   ;; bool _position_check_stop
     (setq _position_check_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _angle_limit_over
     (setq _angle_limit_over (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _safety_error_message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _safety_error_message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get autoware_can_msgs::MicroBusCanSenderStatus :md5sum-) "8e657452a5005d3b21b85259e5ca2de3")
(setf (get autoware_can_msgs::MicroBusCanSenderStatus :datatype-) "autoware_can_msgs/MicroBusCanSenderStatus")
(setf (get autoware_can_msgs::MicroBusCanSenderStatus :definition-)
      "Header header
bool use_position_checker
bool use_input_steer
bool use_input_drive
int8 use_velocity_topic
bool position_check_stop
bool angle_limit_over
string safety_error_message

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



(provide :autoware_can_msgs/MicroBusCanSenderStatus "8e657452a5005d3b21b85259e5ca2de3")


