;; Auto-generated. Do not edit!


(when (boundp 'autoware_can_msgs::MicroBusCan501)
  (if (not (find-package "AUTOWARE_CAN_MSGS"))
    (make-package "AUTOWARE_CAN_MSGS"))
  (shadow 'MicroBusCan501 (find-package "AUTOWARE_CAN_MSGS")))
(unless (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501")
  (make-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))

(in-package "ROS")
;;//! \htmlinclude MicroBusCan501.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*DRIVE_MODE_NONE*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_MODE_NONE* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_MODE_NONE* 0)
(intern "*DRIVE_MODE_STROKE*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_MODE_STROKE* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_MODE_STROKE* 10)
(intern "*DRIVE_MODE_VELOCITY*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_MODE_VELOCITY* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_MODE_VELOCITY* 11)
(intern "*SHIFT_MANUAL*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_MANUAL* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_MANUAL* 0)
(intern "*SHIFT_NOW_CHANGE*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_NOW_CHANGE* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_NOW_CHANGE* 15)
(intern "*SHIFT_P*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_P* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_P* 8)
(intern "*SHIFT_R*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_R* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_R* 9)
(intern "*SHIFT_N*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_N* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_N* 10)
(intern "*SHIFT_D*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_D* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_D* 11)
(intern "*SHIFT_4*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_4* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_4* 12)
(intern "*SHIFT_L*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*SHIFT_L* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*SHIFT_L* 13)
(intern "*STEER_V0*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*STEER_V0* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*STEER_V0* 0)
(intern "*STEER_AUTO*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*STEER_AUTO* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*STEER_AUTO* 10)
(intern "*STEER_NOT_V0*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*STEER_NOT_V0* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*STEER_NOT_V0* 4)
(intern "*STEER_NOT_JOY_CENTER*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*STEER_NOT_JOY_CENTER* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*STEER_NOT_JOY_CENTER* 1)
(intern "*STEER_NOT_BOARD_RES*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*STEER_NOT_BOARD_RES* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*STEER_NOT_BOARD_RES* 8)
(intern "*DRIVE_V0*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_V0* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_V0* 0)
(intern "*DRIVE_AUTO*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_AUTO* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_AUTO* 10)
(intern "*DRIVE_NOT_V0*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_NOT_V0* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_NOT_V0* 4)
(intern "*DRIVE_NOT_JOY_CENTER*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_NOT_JOY_CENTER* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_NOT_JOY_CENTER* 1)
(intern "*DRIVE_NOT_BOARD_RES*" (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(shadow '*DRIVE_NOT_BOARD_RES* (find-package "AUTOWARE_CAN_MSGS::MICROBUSCAN501"))
(defconstant autoware_can_msgs::MicroBusCan501::*DRIVE_NOT_BOARD_RES* 8)
(defclass autoware_can_msgs::MicroBusCan501
  :super ros::object
  :slots (_header _emergency _steer_auto _drive_auto _drive_mode _velocity _steering_angle _pedal _emergency_stop _engine_start _ignition _wiper _light_high _light_low _light_small _horn _hazard _blinker_right _blinker_left _shift _side_brake _automatic_door _read_counter ))

(defmethod autoware_can_msgs::MicroBusCan501
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:emergency __emergency) nil)
    ((:steer_auto __steer_auto) 0)
    ((:drive_auto __drive_auto) 0)
    ((:drive_mode __drive_mode) 0)
    ((:velocity __velocity) 0)
    ((:steering_angle __steering_angle) 0)
    ((:pedal __pedal) 0)
    ((:emergency_stop __emergency_stop) 0)
    ((:engine_start __engine_start) nil)
    ((:ignition __ignition) nil)
    ((:wiper __wiper) nil)
    ((:light_high __light_high) nil)
    ((:light_low __light_low) nil)
    ((:light_small __light_small) nil)
    ((:horn __horn) nil)
    ((:hazard __hazard) nil)
    ((:blinker_right __blinker_right) nil)
    ((:blinker_left __blinker_left) nil)
    ((:shift __shift) 0)
    ((:side_brake __side_brake) 0)
    ((:automatic_door __automatic_door) 0)
    ((:read_counter __read_counter) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _emergency __emergency)
   (setq _steer_auto (round __steer_auto))
   (setq _drive_auto (round __drive_auto))
   (setq _drive_mode (round __drive_mode))
   (setq _velocity (round __velocity))
   (setq _steering_angle (round __steering_angle))
   (setq _pedal (round __pedal))
   (setq _emergency_stop (round __emergency_stop))
   (setq _engine_start __engine_start)
   (setq _ignition __ignition)
   (setq _wiper __wiper)
   (setq _light_high __light_high)
   (setq _light_low __light_low)
   (setq _light_small __light_small)
   (setq _horn __horn)
   (setq _hazard __hazard)
   (setq _blinker_right __blinker_right)
   (setq _blinker_left __blinker_left)
   (setq _shift (round __shift))
   (setq _side_brake (round __side_brake))
   (setq _automatic_door (round __automatic_door))
   (setq _read_counter (round __read_counter))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:emergency
   (&optional __emergency)
   (if __emergency (setq _emergency __emergency)) _emergency)
  (:steer_auto
   (&optional __steer_auto)
   (if __steer_auto (setq _steer_auto __steer_auto)) _steer_auto)
  (:drive_auto
   (&optional __drive_auto)
   (if __drive_auto (setq _drive_auto __drive_auto)) _drive_auto)
  (:drive_mode
   (&optional __drive_mode)
   (if __drive_mode (setq _drive_mode __drive_mode)) _drive_mode)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:pedal
   (&optional __pedal)
   (if __pedal (setq _pedal __pedal)) _pedal)
  (:emergency_stop
   (&optional __emergency_stop)
   (if __emergency_stop (setq _emergency_stop __emergency_stop)) _emergency_stop)
  (:engine_start
   (&optional __engine_start)
   (if __engine_start (setq _engine_start __engine_start)) _engine_start)
  (:ignition
   (&optional __ignition)
   (if __ignition (setq _ignition __ignition)) _ignition)
  (:wiper
   (&optional __wiper)
   (if __wiper (setq _wiper __wiper)) _wiper)
  (:light_high
   (&optional __light_high)
   (if __light_high (setq _light_high __light_high)) _light_high)
  (:light_low
   (&optional __light_low)
   (if __light_low (setq _light_low __light_low)) _light_low)
  (:light_small
   (&optional __light_small)
   (if __light_small (setq _light_small __light_small)) _light_small)
  (:horn
   (&optional __horn)
   (if __horn (setq _horn __horn)) _horn)
  (:hazard
   (&optional __hazard)
   (if __hazard (setq _hazard __hazard)) _hazard)
  (:blinker_right
   (&optional __blinker_right)
   (if __blinker_right (setq _blinker_right __blinker_right)) _blinker_right)
  (:blinker_left
   (&optional __blinker_left)
   (if __blinker_left (setq _blinker_left __blinker_left)) _blinker_left)
  (:shift
   (&optional __shift)
   (if __shift (setq _shift __shift)) _shift)
  (:side_brake
   (&optional __side_brake)
   (if __side_brake (setq _side_brake __side_brake)) _side_brake)
  (:automatic_door
   (&optional __automatic_door)
   (if __automatic_door (setq _automatic_door __automatic_door)) _automatic_door)
  (:read_counter
   (&optional __read_counter)
   (if __read_counter (setq _read_counter __read_counter)) _read_counter)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _emergency
    1
    ;; uint8 _steer_auto
    1
    ;; uint8 _drive_auto
    1
    ;; int8 _drive_mode
    1
    ;; int16 _velocity
    2
    ;; int16 _steering_angle
    2
    ;; int16 _pedal
    2
    ;; uint8 _emergency_stop
    1
    ;; bool _engine_start
    1
    ;; bool _ignition
    1
    ;; bool _wiper
    1
    ;; bool _light_high
    1
    ;; bool _light_low
    1
    ;; bool _light_small
    1
    ;; bool _horn
    1
    ;; bool _hazard
    1
    ;; bool _blinker_right
    1
    ;; bool _blinker_left
    1
    ;; uint8 _shift
    1
    ;; uint8 _side_brake
    1
    ;; uint8 _automatic_door
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
     ;; bool _emergency
       (if _emergency (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _steer_auto
       (write-byte _steer_auto s)
     ;; uint8 _drive_auto
       (write-byte _drive_auto s)
     ;; int8 _drive_mode
       (write-byte _drive_mode s)
     ;; int16 _velocity
       (write-word _velocity s)
     ;; int16 _steering_angle
       (write-word _steering_angle s)
     ;; int16 _pedal
       (write-word _pedal s)
     ;; uint8 _emergency_stop
       (write-byte _emergency_stop s)
     ;; bool _engine_start
       (if _engine_start (write-byte -1 s) (write-byte 0 s))
     ;; bool _ignition
       (if _ignition (write-byte -1 s) (write-byte 0 s))
     ;; bool _wiper
       (if _wiper (write-byte -1 s) (write-byte 0 s))
     ;; bool _light_high
       (if _light_high (write-byte -1 s) (write-byte 0 s))
     ;; bool _light_low
       (if _light_low (write-byte -1 s) (write-byte 0 s))
     ;; bool _light_small
       (if _light_small (write-byte -1 s) (write-byte 0 s))
     ;; bool _horn
       (if _horn (write-byte -1 s) (write-byte 0 s))
     ;; bool _hazard
       (if _hazard (write-byte -1 s) (write-byte 0 s))
     ;; bool _blinker_right
       (if _blinker_right (write-byte -1 s) (write-byte 0 s))
     ;; bool _blinker_left
       (if _blinker_left (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _shift
       (write-byte _shift s)
     ;; uint8 _side_brake
       (write-byte _side_brake s)
     ;; uint8 _automatic_door
       (write-byte _automatic_door s)
     ;; uint32 _read_counter
       (write-long _read_counter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _emergency
     (setq _emergency (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _steer_auto
     (setq _steer_auto (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _drive_auto
     (setq _drive_auto (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _drive_mode
     (setq _drive_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _drive_mode 127) (setq _drive_mode (- _drive_mode 256)))
   ;; int16 _velocity
     (setq _velocity (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _pedal
     (setq _pedal (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _emergency_stop
     (setq _emergency_stop (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _engine_start
     (setq _engine_start (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _ignition
     (setq _ignition (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _wiper
     (setq _wiper (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _light_high
     (setq _light_high (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _light_low
     (setq _light_low (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _light_small
     (setq _light_small (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _horn
     (setq _horn (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _hazard
     (setq _hazard (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _blinker_right
     (setq _blinker_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _blinker_left
     (setq _blinker_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _shift
     (setq _shift (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _side_brake
     (setq _side_brake (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _automatic_door
     (setq _automatic_door (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _read_counter
     (setq _read_counter (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_can_msgs::MicroBusCan501 :md5sum-) "539da6c17a8bf01b808295f7fea2b8ab")
(setf (get autoware_can_msgs::MicroBusCan501 :datatype-) "autoware_can_msgs/MicroBusCan501")
(setf (get autoware_can_msgs::MicroBusCan501 :definition-)
      "int8 DRIVE_MODE_NONE = 0
int8 DRIVE_MODE_STROKE = 10
int8 DRIVE_MODE_VELOCITY = 11

int8 SHIFT_MANUAL = 0
int8 SHIFT_NOW_CHANGE = 15
int8 SHIFT_P = 8
int8 SHIFT_R = 9
int8 SHIFT_N = 10
int8 SHIFT_D = 11
int8 SHIFT_4 = 12
int8 SHIFT_L = 13

uint8 STEER_V0 = 0
uint8 STEER_AUTO = 10
uint8 STEER_NOT_V0 = 4
uint8 STEER_NOT_JOY_CENTER = 1
uint8 STEER_NOT_BOARD_RES = 8

uint8 DRIVE_V0 = 0
uint8 DRIVE_AUTO = 10
uint8 DRIVE_NOT_V0 = 4
uint8 DRIVE_NOT_JOY_CENTER = 1
uint8 DRIVE_NOT_BOARD_RES = 8

Header header
bool emergency
uint8 steer_auto
uint8 drive_auto
int8 drive_mode
int16 velocity
int16 steering_angle
int16 pedal
uint8 emergency_stop
bool engine_start
bool ignition
bool wiper
bool light_high
bool light_low
bool light_small
bool horn
bool hazard
bool blinker_right
bool blinker_left
uint8 shift
uint8 side_brake
uint8 automatic_door
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



(provide :autoware_can_msgs/MicroBusCan501 "539da6c17a8bf01b808295f7fea2b8ab")


