; Auto-generated. Do not edit!


(cl:in-package autoware_can_msgs-msg)


;//! \htmlinclude MicroBusCan502.msg.html

(cl:defclass <MicroBusCan502> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (cycle_time
    :reader cycle_time
    :initarg :cycle_time
    :type cl:float
    :initform 0.0)
   (angle_actual
    :reader angle_actual
    :initarg :angle_actual
    :type cl:fixnum
    :initform 0)
   (angle_deg
    :reader angle_deg
    :initarg :angle_deg
    :type cl:float
    :initform 0.0)
   (velocity_actual
    :reader velocity_actual
    :initarg :velocity_actual
    :type cl:fixnum
    :initform 0)
   (velocity_average
    :reader velocity_average
    :initarg :velocity_average
    :type cl:fixnum
    :initform 0)
   (velocity_median
    :reader velocity_median
    :initarg :velocity_median
    :type cl:fixnum
    :initform 0)
   (acceleration_actual
    :reader acceleration_actual
    :initarg :acceleration_actual
    :type cl:fixnum
    :initform 0)
   (acceleration_average
    :reader acceleration_average
    :initarg :acceleration_average
    :type cl:fixnum
    :initform 0)
   (acceleration_median
    :reader acceleration_median
    :initarg :acceleration_median
    :type cl:fixnum
    :initform 0)
   (velocity_mps
    :reader velocity_mps
    :initarg :velocity_mps
    :type cl:float
    :initform 0.0)
   (clutch
    :reader clutch
    :initarg :clutch
    :type cl:boolean
    :initform cl:nil)
   (read_counter
    :reader read_counter
    :initarg :read_counter
    :type cl:integer
    :initform 0))
)

(cl:defclass MicroBusCan502 (<MicroBusCan502>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MicroBusCan502>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MicroBusCan502)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_can_msgs-msg:<MicroBusCan502> is deprecated: use autoware_can_msgs-msg:MicroBusCan502 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:header-val is deprecated.  Use autoware_can_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'cycle_time-val :lambda-list '(m))
(cl:defmethod cycle_time-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:cycle_time-val is deprecated.  Use autoware_can_msgs-msg:cycle_time instead.")
  (cycle_time m))

(cl:ensure-generic-function 'angle_actual-val :lambda-list '(m))
(cl:defmethod angle_actual-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:angle_actual-val is deprecated.  Use autoware_can_msgs-msg:angle_actual instead.")
  (angle_actual m))

(cl:ensure-generic-function 'angle_deg-val :lambda-list '(m))
(cl:defmethod angle_deg-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:angle_deg-val is deprecated.  Use autoware_can_msgs-msg:angle_deg instead.")
  (angle_deg m))

(cl:ensure-generic-function 'velocity_actual-val :lambda-list '(m))
(cl:defmethod velocity_actual-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:velocity_actual-val is deprecated.  Use autoware_can_msgs-msg:velocity_actual instead.")
  (velocity_actual m))

(cl:ensure-generic-function 'velocity_average-val :lambda-list '(m))
(cl:defmethod velocity_average-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:velocity_average-val is deprecated.  Use autoware_can_msgs-msg:velocity_average instead.")
  (velocity_average m))

(cl:ensure-generic-function 'velocity_median-val :lambda-list '(m))
(cl:defmethod velocity_median-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:velocity_median-val is deprecated.  Use autoware_can_msgs-msg:velocity_median instead.")
  (velocity_median m))

(cl:ensure-generic-function 'acceleration_actual-val :lambda-list '(m))
(cl:defmethod acceleration_actual-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:acceleration_actual-val is deprecated.  Use autoware_can_msgs-msg:acceleration_actual instead.")
  (acceleration_actual m))

(cl:ensure-generic-function 'acceleration_average-val :lambda-list '(m))
(cl:defmethod acceleration_average-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:acceleration_average-val is deprecated.  Use autoware_can_msgs-msg:acceleration_average instead.")
  (acceleration_average m))

(cl:ensure-generic-function 'acceleration_median-val :lambda-list '(m))
(cl:defmethod acceleration_median-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:acceleration_median-val is deprecated.  Use autoware_can_msgs-msg:acceleration_median instead.")
  (acceleration_median m))

(cl:ensure-generic-function 'velocity_mps-val :lambda-list '(m))
(cl:defmethod velocity_mps-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:velocity_mps-val is deprecated.  Use autoware_can_msgs-msg:velocity_mps instead.")
  (velocity_mps m))

(cl:ensure-generic-function 'clutch-val :lambda-list '(m))
(cl:defmethod clutch-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:clutch-val is deprecated.  Use autoware_can_msgs-msg:clutch instead.")
  (clutch m))

(cl:ensure-generic-function 'read_counter-val :lambda-list '(m))
(cl:defmethod read_counter-val ((m <MicroBusCan502>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:read_counter-val is deprecated.  Use autoware_can_msgs-msg:read_counter instead.")
  (read_counter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MicroBusCan502>) ostream)
  "Serializes a message object of type '<MicroBusCan502>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cycle_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'angle_actual)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'velocity_actual)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_average)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_median)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acceleration_actual)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acceleration_average)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'acceleration_median)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity_mps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clutch) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MicroBusCan502>) istream)
  "Deserializes a message object of type '<MicroBusCan502>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cycle_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle_actual) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle_deg) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_actual) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_average) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_median) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acceleration_actual) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acceleration_average) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'acceleration_median) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity_mps) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'clutch) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MicroBusCan502>)))
  "Returns string type for a message object of type '<MicroBusCan502>"
  "autoware_can_msgs/MicroBusCan502")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MicroBusCan502)))
  "Returns string type for a message object of type 'MicroBusCan502"
  "autoware_can_msgs/MicroBusCan502")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MicroBusCan502>)))
  "Returns md5sum for a message object of type '<MicroBusCan502>"
  "a1b8e414429b8dde101c01e1b7adae99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MicroBusCan502)))
  "Returns md5sum for a message object of type 'MicroBusCan502"
  "a1b8e414429b8dde101c01e1b7adae99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MicroBusCan502>)))
  "Returns full string definition for message of type '<MicroBusCan502>"
  (cl:format cl:nil "Header header~%float64 cycle_time~%int16 angle_actual~%float64 angle_deg~%int16 velocity_actual~%int16 velocity_average~%int16 velocity_median~%int16 acceleration_actual~%int16 acceleration_average~%int16 acceleration_median~%float64 velocity_mps~%bool clutch~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MicroBusCan502)))
  "Returns full string definition for message of type 'MicroBusCan502"
  (cl:format cl:nil "Header header~%float64 cycle_time~%int16 angle_actual~%float64 angle_deg~%int16 velocity_actual~%int16 velocity_average~%int16 velocity_median~%int16 acceleration_actual~%int16 acceleration_average~%int16 acceleration_median~%float64 velocity_mps~%bool clutch~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MicroBusCan502>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     2
     8
     2
     2
     2
     2
     2
     2
     8
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MicroBusCan502>))
  "Converts a ROS message object to a list"
  (cl:list 'MicroBusCan502
    (cl:cons ':header (header msg))
    (cl:cons ':cycle_time (cycle_time msg))
    (cl:cons ':angle_actual (angle_actual msg))
    (cl:cons ':angle_deg (angle_deg msg))
    (cl:cons ':velocity_actual (velocity_actual msg))
    (cl:cons ':velocity_average (velocity_average msg))
    (cl:cons ':velocity_median (velocity_median msg))
    (cl:cons ':acceleration_actual (acceleration_actual msg))
    (cl:cons ':acceleration_average (acceleration_average msg))
    (cl:cons ':acceleration_median (acceleration_median msg))
    (cl:cons ':velocity_mps (velocity_mps msg))
    (cl:cons ':clutch (clutch msg))
    (cl:cons ':read_counter (read_counter msg))
))
