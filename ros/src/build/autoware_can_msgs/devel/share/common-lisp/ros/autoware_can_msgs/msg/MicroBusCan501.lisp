; Auto-generated. Do not edit!


(cl:in-package autoware_can_msgs-msg)


;//! \htmlinclude MicroBusCan501.msg.html

(cl:defclass <MicroBusCan501> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (emergency
    :reader emergency
    :initarg :emergency
    :type cl:boolean
    :initform cl:nil)
   (steer_auto
    :reader steer_auto
    :initarg :steer_auto
    :type cl:fixnum
    :initform 0)
   (drive_auto
    :reader drive_auto
    :initarg :drive_auto
    :type cl:fixnum
    :initform 0)
   (drive_mode
    :reader drive_mode
    :initarg :drive_mode
    :type cl:fixnum
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:fixnum
    :initform 0)
   (steering_angle
    :reader steering_angle
    :initarg :steering_angle
    :type cl:fixnum
    :initform 0)
   (pedal
    :reader pedal
    :initarg :pedal
    :type cl:fixnum
    :initform 0)
   (emergency_stop
    :reader emergency_stop
    :initarg :emergency_stop
    :type cl:fixnum
    :initform 0)
   (engine_start
    :reader engine_start
    :initarg :engine_start
    :type cl:boolean
    :initform cl:nil)
   (ignition
    :reader ignition
    :initarg :ignition
    :type cl:boolean
    :initform cl:nil)
   (wiper
    :reader wiper
    :initarg :wiper
    :type cl:boolean
    :initform cl:nil)
   (light_high
    :reader light_high
    :initarg :light_high
    :type cl:boolean
    :initform cl:nil)
   (light_low
    :reader light_low
    :initarg :light_low
    :type cl:boolean
    :initform cl:nil)
   (light_small
    :reader light_small
    :initarg :light_small
    :type cl:boolean
    :initform cl:nil)
   (horn
    :reader horn
    :initarg :horn
    :type cl:boolean
    :initform cl:nil)
   (hazard
    :reader hazard
    :initarg :hazard
    :type cl:boolean
    :initform cl:nil)
   (blinker_right
    :reader blinker_right
    :initarg :blinker_right
    :type cl:boolean
    :initform cl:nil)
   (blinker_left
    :reader blinker_left
    :initarg :blinker_left
    :type cl:boolean
    :initform cl:nil)
   (shift
    :reader shift
    :initarg :shift
    :type cl:fixnum
    :initform 0)
   (side_brake
    :reader side_brake
    :initarg :side_brake
    :type cl:fixnum
    :initform 0)
   (automatic_door
    :reader automatic_door
    :initarg :automatic_door
    :type cl:fixnum
    :initform 0)
   (read_counter
    :reader read_counter
    :initarg :read_counter
    :type cl:integer
    :initform 0))
)

(cl:defclass MicroBusCan501 (<MicroBusCan501>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MicroBusCan501>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MicroBusCan501)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_can_msgs-msg:<MicroBusCan501> is deprecated: use autoware_can_msgs-msg:MicroBusCan501 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:header-val is deprecated.  Use autoware_can_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'emergency-val :lambda-list '(m))
(cl:defmethod emergency-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:emergency-val is deprecated.  Use autoware_can_msgs-msg:emergency instead.")
  (emergency m))

(cl:ensure-generic-function 'steer_auto-val :lambda-list '(m))
(cl:defmethod steer_auto-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:steer_auto-val is deprecated.  Use autoware_can_msgs-msg:steer_auto instead.")
  (steer_auto m))

(cl:ensure-generic-function 'drive_auto-val :lambda-list '(m))
(cl:defmethod drive_auto-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:drive_auto-val is deprecated.  Use autoware_can_msgs-msg:drive_auto instead.")
  (drive_auto m))

(cl:ensure-generic-function 'drive_mode-val :lambda-list '(m))
(cl:defmethod drive_mode-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:drive_mode-val is deprecated.  Use autoware_can_msgs-msg:drive_mode instead.")
  (drive_mode m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:velocity-val is deprecated.  Use autoware_can_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'steering_angle-val :lambda-list '(m))
(cl:defmethod steering_angle-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:steering_angle-val is deprecated.  Use autoware_can_msgs-msg:steering_angle instead.")
  (steering_angle m))

(cl:ensure-generic-function 'pedal-val :lambda-list '(m))
(cl:defmethod pedal-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:pedal-val is deprecated.  Use autoware_can_msgs-msg:pedal instead.")
  (pedal m))

(cl:ensure-generic-function 'emergency_stop-val :lambda-list '(m))
(cl:defmethod emergency_stop-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:emergency_stop-val is deprecated.  Use autoware_can_msgs-msg:emergency_stop instead.")
  (emergency_stop m))

(cl:ensure-generic-function 'engine_start-val :lambda-list '(m))
(cl:defmethod engine_start-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:engine_start-val is deprecated.  Use autoware_can_msgs-msg:engine_start instead.")
  (engine_start m))

(cl:ensure-generic-function 'ignition-val :lambda-list '(m))
(cl:defmethod ignition-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:ignition-val is deprecated.  Use autoware_can_msgs-msg:ignition instead.")
  (ignition m))

(cl:ensure-generic-function 'wiper-val :lambda-list '(m))
(cl:defmethod wiper-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:wiper-val is deprecated.  Use autoware_can_msgs-msg:wiper instead.")
  (wiper m))

(cl:ensure-generic-function 'light_high-val :lambda-list '(m))
(cl:defmethod light_high-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:light_high-val is deprecated.  Use autoware_can_msgs-msg:light_high instead.")
  (light_high m))

(cl:ensure-generic-function 'light_low-val :lambda-list '(m))
(cl:defmethod light_low-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:light_low-val is deprecated.  Use autoware_can_msgs-msg:light_low instead.")
  (light_low m))

(cl:ensure-generic-function 'light_small-val :lambda-list '(m))
(cl:defmethod light_small-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:light_small-val is deprecated.  Use autoware_can_msgs-msg:light_small instead.")
  (light_small m))

(cl:ensure-generic-function 'horn-val :lambda-list '(m))
(cl:defmethod horn-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:horn-val is deprecated.  Use autoware_can_msgs-msg:horn instead.")
  (horn m))

(cl:ensure-generic-function 'hazard-val :lambda-list '(m))
(cl:defmethod hazard-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:hazard-val is deprecated.  Use autoware_can_msgs-msg:hazard instead.")
  (hazard m))

(cl:ensure-generic-function 'blinker_right-val :lambda-list '(m))
(cl:defmethod blinker_right-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:blinker_right-val is deprecated.  Use autoware_can_msgs-msg:blinker_right instead.")
  (blinker_right m))

(cl:ensure-generic-function 'blinker_left-val :lambda-list '(m))
(cl:defmethod blinker_left-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:blinker_left-val is deprecated.  Use autoware_can_msgs-msg:blinker_left instead.")
  (blinker_left m))

(cl:ensure-generic-function 'shift-val :lambda-list '(m))
(cl:defmethod shift-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:shift-val is deprecated.  Use autoware_can_msgs-msg:shift instead.")
  (shift m))

(cl:ensure-generic-function 'side_brake-val :lambda-list '(m))
(cl:defmethod side_brake-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:side_brake-val is deprecated.  Use autoware_can_msgs-msg:side_brake instead.")
  (side_brake m))

(cl:ensure-generic-function 'automatic_door-val :lambda-list '(m))
(cl:defmethod automatic_door-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:automatic_door-val is deprecated.  Use autoware_can_msgs-msg:automatic_door instead.")
  (automatic_door m))

(cl:ensure-generic-function 'read_counter-val :lambda-list '(m))
(cl:defmethod read_counter-val ((m <MicroBusCan501>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:read_counter-val is deprecated.  Use autoware_can_msgs-msg:read_counter instead.")
  (read_counter m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MicroBusCan501>)))
    "Constants for message type '<MicroBusCan501>"
  '((:DRIVE_MODE_NONE . 0)
    (:DRIVE_MODE_STROKE . 10)
    (:DRIVE_MODE_VELOCITY . 11)
    (:SHIFT_MANUAL . 0)
    (:SHIFT_NOW_CHANGE . 15)
    (:SHIFT_P . 8)
    (:SHIFT_R . 9)
    (:SHIFT_N . 10)
    (:SHIFT_D . 11)
    (:SHIFT_4 . 12)
    (:SHIFT_L . 13)
    (:STEER_V0 . 0)
    (:STEER_AUTO . 10)
    (:STEER_NOT_V0 . 4)
    (:STEER_NOT_JOY_CENTER . 1)
    (:STEER_NOT_BOARD_RES . 8)
    (:DRIVE_V0 . 0)
    (:DRIVE_AUTO . 10)
    (:DRIVE_NOT_V0 . 4)
    (:DRIVE_NOT_JOY_CENTER . 1)
    (:DRIVE_NOT_BOARD_RES . 8))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MicroBusCan501)))
    "Constants for message type 'MicroBusCan501"
  '((:DRIVE_MODE_NONE . 0)
    (:DRIVE_MODE_STROKE . 10)
    (:DRIVE_MODE_VELOCITY . 11)
    (:SHIFT_MANUAL . 0)
    (:SHIFT_NOW_CHANGE . 15)
    (:SHIFT_P . 8)
    (:SHIFT_R . 9)
    (:SHIFT_N . 10)
    (:SHIFT_D . 11)
    (:SHIFT_4 . 12)
    (:SHIFT_L . 13)
    (:STEER_V0 . 0)
    (:STEER_AUTO . 10)
    (:STEER_NOT_V0 . 4)
    (:STEER_NOT_JOY_CENTER . 1)
    (:STEER_NOT_BOARD_RES . 8)
    (:DRIVE_V0 . 0)
    (:DRIVE_AUTO . 10)
    (:DRIVE_NOT_V0 . 4)
    (:DRIVE_NOT_JOY_CENTER . 1)
    (:DRIVE_NOT_BOARD_RES . 8))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MicroBusCan501>) ostream)
  "Serializes a message object of type '<MicroBusCan501>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'emergency) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steer_auto)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_auto)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'drive_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'steering_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pedal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'emergency_stop)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'engine_start) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ignition) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wiper) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light_high) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light_low) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light_small) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'horn) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hazard) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blinker_right) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blinker_left) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'shift)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'side_brake)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'automatic_door)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MicroBusCan501>) istream)
  "Deserializes a message object of type '<MicroBusCan501>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'emergency) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steer_auto)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_auto)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'drive_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steering_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pedal) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'emergency_stop)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'engine_start) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'ignition) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'wiper) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'light_high) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'light_low) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'light_small) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'horn) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'hazard) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blinker_right) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'blinker_left) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'shift)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'side_brake)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'automatic_door)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MicroBusCan501>)))
  "Returns string type for a message object of type '<MicroBusCan501>"
  "autoware_can_msgs/MicroBusCan501")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MicroBusCan501)))
  "Returns string type for a message object of type 'MicroBusCan501"
  "autoware_can_msgs/MicroBusCan501")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MicroBusCan501>)))
  "Returns md5sum for a message object of type '<MicroBusCan501>"
  "539da6c17a8bf01b808295f7fea2b8ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MicroBusCan501)))
  "Returns md5sum for a message object of type 'MicroBusCan501"
  "539da6c17a8bf01b808295f7fea2b8ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MicroBusCan501>)))
  "Returns full string definition for message of type '<MicroBusCan501>"
  (cl:format cl:nil "int8 DRIVE_MODE_NONE = 0~%int8 DRIVE_MODE_STROKE = 10~%int8 DRIVE_MODE_VELOCITY = 11~%~%int8 SHIFT_MANUAL = 0~%int8 SHIFT_NOW_CHANGE = 15~%int8 SHIFT_P = 8~%int8 SHIFT_R = 9~%int8 SHIFT_N = 10~%int8 SHIFT_D = 11~%int8 SHIFT_4 = 12~%int8 SHIFT_L = 13~%~%uint8 STEER_V0 = 0~%uint8 STEER_AUTO = 10~%uint8 STEER_NOT_V0 = 4~%uint8 STEER_NOT_JOY_CENTER = 1~%uint8 STEER_NOT_BOARD_RES = 8~%~%uint8 DRIVE_V0 = 0~%uint8 DRIVE_AUTO = 10~%uint8 DRIVE_NOT_V0 = 4~%uint8 DRIVE_NOT_JOY_CENTER = 1~%uint8 DRIVE_NOT_BOARD_RES = 8~%~%Header header~%bool emergency~%uint8 steer_auto~%uint8 drive_auto~%int8 drive_mode~%int16 velocity~%int16 steering_angle~%int16 pedal~%uint8 emergency_stop~%bool engine_start~%bool ignition~%bool wiper~%bool light_high~%bool light_low~%bool light_small~%bool horn~%bool hazard~%bool blinker_right~%bool blinker_left~%uint8 shift~%uint8 side_brake~%uint8 automatic_door~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MicroBusCan501)))
  "Returns full string definition for message of type 'MicroBusCan501"
  (cl:format cl:nil "int8 DRIVE_MODE_NONE = 0~%int8 DRIVE_MODE_STROKE = 10~%int8 DRIVE_MODE_VELOCITY = 11~%~%int8 SHIFT_MANUAL = 0~%int8 SHIFT_NOW_CHANGE = 15~%int8 SHIFT_P = 8~%int8 SHIFT_R = 9~%int8 SHIFT_N = 10~%int8 SHIFT_D = 11~%int8 SHIFT_4 = 12~%int8 SHIFT_L = 13~%~%uint8 STEER_V0 = 0~%uint8 STEER_AUTO = 10~%uint8 STEER_NOT_V0 = 4~%uint8 STEER_NOT_JOY_CENTER = 1~%uint8 STEER_NOT_BOARD_RES = 8~%~%uint8 DRIVE_V0 = 0~%uint8 DRIVE_AUTO = 10~%uint8 DRIVE_NOT_V0 = 4~%uint8 DRIVE_NOT_JOY_CENTER = 1~%uint8 DRIVE_NOT_BOARD_RES = 8~%~%Header header~%bool emergency~%uint8 steer_auto~%uint8 drive_auto~%int8 drive_mode~%int16 velocity~%int16 steering_angle~%int16 pedal~%uint8 emergency_stop~%bool engine_start~%bool ignition~%bool wiper~%bool light_high~%bool light_low~%bool light_small~%bool horn~%bool hazard~%bool blinker_right~%bool blinker_left~%uint8 shift~%uint8 side_brake~%uint8 automatic_door~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MicroBusCan501>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     2
     2
     2
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MicroBusCan501>))
  "Converts a ROS message object to a list"
  (cl:list 'MicroBusCan501
    (cl:cons ':header (header msg))
    (cl:cons ':emergency (emergency msg))
    (cl:cons ':steer_auto (steer_auto msg))
    (cl:cons ':drive_auto (drive_auto msg))
    (cl:cons ':drive_mode (drive_mode msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':steering_angle (steering_angle msg))
    (cl:cons ':pedal (pedal msg))
    (cl:cons ':emergency_stop (emergency_stop msg))
    (cl:cons ':engine_start (engine_start msg))
    (cl:cons ':ignition (ignition msg))
    (cl:cons ':wiper (wiper msg))
    (cl:cons ':light_high (light_high msg))
    (cl:cons ':light_low (light_low msg))
    (cl:cons ':light_small (light_small msg))
    (cl:cons ':horn (horn msg))
    (cl:cons ':hazard (hazard msg))
    (cl:cons ':blinker_right (blinker_right msg))
    (cl:cons ':blinker_left (blinker_left msg))
    (cl:cons ':shift (shift msg))
    (cl:cons ':side_brake (side_brake msg))
    (cl:cons ':automatic_door (automatic_door msg))
    (cl:cons ':read_counter (read_counter msg))
))
