;; Auto-generated. Do not edit!


(when (boundp 'autoware_can_msgs::MicroBusCan503)
  (if (not (find-package "AUTOWARE_CAN_MSGS"))
    (make-package "AUTOWARE_CAN_MSGS"))
  (shadow 'MicroBusCan503 (find-package "AUTOWARE_CAN_MSGS")))
(unless (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN503")
  (make-package "AUTOWARE_CAN_MSGS::MICROBUSCAN503"))

(in-package "ROS")
;;//! \htmlinclude MicroBusCan503.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_can_msgs::MicroBusCan503
  :super ros::object
  :slots (_header _pedal_voltage _pedal_displacement _engine_rotation _clutch _read_counter ))

(defmethod autoware_can_msgs::MicroBusCan503
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pedal_voltage __pedal_voltage) 0)
    ((:pedal_displacement __pedal_displacement) 0)
    ((:engine_rotation __engine_rotation) 0)
    ((:clutch __clutch) nil)
    ((:read_counter __read_counter) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pedal_voltage (round __pedal_voltage))
   (setq _pedal_displacement (round __pedal_displacement))
   (setq _engine_rotation (round __engine_rotation))
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
  (:pedal_voltage
   (&optional __pedal_voltage)
   (if __pedal_voltage (setq _pedal_voltage __pedal_voltage)) _pedal_voltage)
  (:pedal_displacement
   (&optional __pedal_displacement)
   (if __pedal_displacement (setq _pedal_displacement __pedal_displacement)) _pedal_displacement)
  (:engine_rotation
   (&optional __engine_rotation)
   (if __engine_rotation (setq _engine_rotation __engine_rotation)) _engine_rotation)
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
    ;; int16 _pedal_voltage
    2
    ;; int16 _pedal_displacement
    2
    ;; int16 _engine_rotation
    2
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
     ;; int16 _pedal_voltage
       (write-word _pedal_voltage s)
     ;; int16 _pedal_displacement
       (write-word _pedal_displacement s)
     ;; int16 _engine_rotation
       (write-word _engine_rotation s)
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
   ;; int16 _pedal_voltage
     (setq _pedal_voltage (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pedal_displacement
     (setq _pedal_displacement (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _engine_rotation
     (setq _engine_rotation (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _clutch
     (setq _clutch (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint32 _read_counter
     (setq _read_counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_can_msgs::MicroBusCan503 :md5sum-) "574e15f63e6b6b35ed4b724a0cd43a84")
(setf (get autoware_can_msgs::MicroBusCan503 :datatype-) "autoware_can_msgs/MicroBusCan503")
(setf (get autoware_can_msgs::MicroBusCan503 :definition-)
      "Header header
int16 pedal_voltage
int16 pedal_displacement
int16 engine_rotation
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



(provide :autoware_can_msgs/MicroBusCan503 "574e15f63e6b6b35ed4b724a0cd43a84")


