; Auto-generated. Do not edit!


(cl:in-package autoware_can_msgs-msg)


;//! \htmlinclude MicroBusCan503.msg.html

(cl:defclass <MicroBusCan503> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pedal_voltage
    :reader pedal_voltage
    :initarg :pedal_voltage
    :type cl:fixnum
    :initform 0)
   (pedal_displacement
    :reader pedal_displacement
    :initarg :pedal_displacement
    :type cl:fixnum
    :initform 0)
   (engine_rotation
    :reader engine_rotation
    :initarg :engine_rotation
    :type cl:fixnum
    :initform 0)
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

(cl:defclass MicroBusCan503 (<MicroBusCan503>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MicroBusCan503>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MicroBusCan503)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_can_msgs-msg:<MicroBusCan503> is deprecated: use autoware_can_msgs-msg:MicroBusCan503 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:header-val is deprecated.  Use autoware_can_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pedal_voltage-val :lambda-list '(m))
(cl:defmethod pedal_voltage-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:pedal_voltage-val is deprecated.  Use autoware_can_msgs-msg:pedal_voltage instead.")
  (pedal_voltage m))

(cl:ensure-generic-function 'pedal_displacement-val :lambda-list '(m))
(cl:defmethod pedal_displacement-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:pedal_displacement-val is deprecated.  Use autoware_can_msgs-msg:pedal_displacement instead.")
  (pedal_displacement m))

(cl:ensure-generic-function 'engine_rotation-val :lambda-list '(m))
(cl:defmethod engine_rotation-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:engine_rotation-val is deprecated.  Use autoware_can_msgs-msg:engine_rotation instead.")
  (engine_rotation m))

(cl:ensure-generic-function 'clutch-val :lambda-list '(m))
(cl:defmethod clutch-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:clutch-val is deprecated.  Use autoware_can_msgs-msg:clutch instead.")
  (clutch m))

(cl:ensure-generic-function 'read_counter-val :lambda-list '(m))
(cl:defmethod read_counter-val ((m <MicroBusCan503>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:read_counter-val is deprecated.  Use autoware_can_msgs-msg:read_counter instead.")
  (read_counter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MicroBusCan503>) ostream)
  "Serializes a message object of type '<MicroBusCan503>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'pedal_voltage)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pedal_displacement)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'engine_rotation)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clutch) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MicroBusCan503>) istream)
  "Deserializes a message object of type '<MicroBusCan503>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pedal_voltage) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pedal_displacement) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'engine_rotation) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'clutch) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'read_counter)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MicroBusCan503>)))
  "Returns string type for a message object of type '<MicroBusCan503>"
  "autoware_can_msgs/MicroBusCan503")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MicroBusCan503)))
  "Returns string type for a message object of type 'MicroBusCan503"
  "autoware_can_msgs/MicroBusCan503")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MicroBusCan503>)))
  "Returns md5sum for a message object of type '<MicroBusCan503>"
  "574e15f63e6b6b35ed4b724a0cd43a84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MicroBusCan503)))
  "Returns md5sum for a message object of type 'MicroBusCan503"
  "574e15f63e6b6b35ed4b724a0cd43a84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MicroBusCan503>)))
  "Returns full string definition for message of type '<MicroBusCan503>"
  (cl:format cl:nil "Header header~%int16 pedal_voltage~%int16 pedal_displacement~%int16 engine_rotation~%bool clutch~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MicroBusCan503)))
  "Returns full string definition for message of type 'MicroBusCan503"
  (cl:format cl:nil "Header header~%int16 pedal_voltage~%int16 pedal_displacement~%int16 engine_rotation~%bool clutch~%uint32 read_counter~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MicroBusCan503>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
     2
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MicroBusCan503>))
  "Converts a ROS message object to a list"
  (cl:list 'MicroBusCan503
    (cl:cons ':header (header msg))
    (cl:cons ':pedal_voltage (pedal_voltage msg))
    (cl:cons ':pedal_displacement (pedal_displacement msg))
    (cl:cons ':engine_rotation (engine_rotation msg))
    (cl:cons ':clutch (clutch msg))
    (cl:cons ':read_counter (read_counter msg))
))
