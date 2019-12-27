;; Auto-generated. Do not edit!


(when (boundp 'autoware_can_msgs::MicroBusCan502)
  (if (not (find-package "AUTOWARE_CAN_MSGS"))
    (make-package "AUTOWARE_CAN_MSGS"))
  (shadow 'MicroBusCan502 (find-package "AUTOWARE_CAN_MSGS")))
(unless (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN502")
  (make-package "AUTOWARE_CAN_MSGS::MICROBUSCAN502"))

(in-package "ROS")
;;//! \htmlinclude MicroBusCan502.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_can_msgs::MicroBusCan502
  :super ros::object
  :slots (_header _cycle_time _angle_actual _angle_deg _velocity_actual _velocity_average _velocity_median _acceleration_actual _acceleration_average _acceleration_median _velocity_mps _clutch _read_counter ))

(defmethod autoware_can_msgs::MicroBusCan502
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:cycle_time __cycle_time) 0.0)
    ((:angle_actual __angle_actual) 0)
    ((:angle_deg __angle_deg) 0.0)
    ((:velocity_actual __velocity_actual) 0)
    ((:velocity_average __velocity_average) 0)
    ((:velocity_median __velocity_median) 0)
    ((:acceleration_actual __acceleration_actual) 0)
    ((:acceleration_average __acceleration_average) 0)
    ((:acceleration_median __acceleration_median) 0)
    ((:velocity_mps __velocity_mps) 0.0)
    ((:clutch __clutch) nil)
    ((:read_counter __read_counter) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _cycle_time (float __cycle_time))
   (setq _angle_actual (round __angle_actual))
   (setq _angle_deg (float __angle_deg))
   (setq _velocity_actual (round __velocity_actual))
   (setq _velocity_average (round __velocity_average))
   (setq _velocity_median (round __velocity_median))
   (setq _acceleration_actual (round __acceleration_actual))
   (setq _acceleration_average (round __acceleration_average))
   (setq _acceleration_median (round __acceleration_median))
   (setq _velocity_mps (float __velocity_mps))
   (setq _clutch __clutch)
   (setq _read_counter (round __read_counter))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:cycle_time
   (&optional __cycle_time)
   (if __cycle_time (setq _cycle_time __cycle_time)) _cycle_time)
  (:angle_actual
   (&optional __angle_actual)
   (if __angle_actual (setq _angle_actual __angle_actual)) _angle_actual)
  (:angle_deg
   (&optional __angle_deg)
   (if __angle_deg (setq _angle_deg __angle_deg)) _angle_deg)
  (:velocity_actual
   (&optional __velocity_actual)
   (if __velocity_actual (setq _velocity_actual __velocity_actual)) _velocity_actual)
  (:velocity_average
   (&optional __velocity_average)
   (if __velocity_average (setq _velocity_average __velocity_average)) _velocity_average)
  (:velocity_median
   (&optional __velocity_median)
   (if __velocity_median (setq _velocity_median __velocity_median)) _velocity_median)
  (:acceleration_actual
   (&optional __acceleration_actual)
   (if __acceleration_actual (setq _acceleration_actual __acceleration_actual)) _acceleration_actual)
  (:acceleration_average
   (&optional __acceleration_average)
   (if __acceleration_average (setq _acceleration_average __acceleration_average)) _acceleration_average)
  (:acceleration_median
   (&optional __acceleration_median)
   (if __acceleration_median (setq _acceleration_median __acceleration_median)) _acceleration_median)
  (:velocity_mps
   (&optional __velocity_mps)
   (if __velocity_mps (setq _velocity_mps __velocity_mps)) _velocity_mps)
  (:clutch
   (&optional __clutch)
   (if __clutch (setq _clutch __clutch)) _clutch)
  (:read_counter
   (&optional __read_counter)
   (if __read_counter (setq _read_counter __read_counter)) _read_counter)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _cycle_time
    8
    ;; int16 _angle_actual
    2
    ;; float64 _angle_deg
    8
    ;; int16 _velocity_actual
    2
    ;; int16 _velocity_average
    2
    ;; int16 _velocity_median
    2
    ;; int16 _acceleration_actual
    2
    ;; int16 _acceleration_average
    2
    ;; int16 _acceleration_median
    2
    ;; float64 _velocity_mps
    8
    ;; bool _clutch
    1
    ;; uint32 _read_counter
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _cycle_time
       (sys::poke _cycle_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _angle_actual
       (write-word _angle_actual s)
     ;; float64 _angle_deg
       (sys::poke _angle_deg (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _velocity_actual
       (write-word _velocity_actual s)
     ;; int16 _velocity_average
       (write-word _velocity_average s)
     ;; int16 _velocity_median
       (write-word _velocity_median s)
     ;; int16 _acceleration_actual
       (write-word _acceleration_actual s)
     ;; int16 _acceleration_average
       (write-word _acceleration_average s)
     ;; int16 _acceleration_median
       (write-word _acceleration_median s)
     ;; float64 _velocity_mps
       (sys::poke _velocity_mps (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _clutch
       (if _clutch (write-byte -1 s) (write-byte 0 s))
     ;; uint32 _read_counter
       (write-long _read_counter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _cycle_time
     (setq _cycle_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _angle_actual
     (setq _angle_actual (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _angle_deg
     (setq _angle_deg (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _velocity_actual
     (setq _velocity_actual (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _velocity_average
     (setq _velocity_average (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _velocity_median
     (setq _velocity_median (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acceleration_actual
     (setq _acceleration_actual (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acceleration_average
     (setq _acceleration_average (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _acceleration_median
     (setq _acceleration_median (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _velocity_mps
     (setq _velocity_mps (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _clutch
     (setq _clutch (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint32 _read_counter
     (setq _read_counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_can_msgs::MicroBusCan502 :md5sum-) "a1b8e414429b8dde101c01e1b7adae99")
(setf (get autoware_can_msgs::MicroBusCan502 :datatype-) "autoware_can_msgs/MicroBusCan502")
(setf (get autoware_can_msgs::MicroBusCan502 :definition-)
      "Header header
float64 cycle_time
int16 angle_actual
float64 angle_deg
int16 velocity_actual
int16 velocity_average
int16 velocity_median
int16 acceleration_actual
int16 acceleration_average
int16 acceleration_median
float64 velocity_mps
bool clutch
uint32 read_counter

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



(provide :autoware_can_msgs/MicroBusCan502 "a1b8e414429b8dde101c01e1b7adae99")


