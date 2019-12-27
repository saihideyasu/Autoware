; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigManualDriveStroke.msg.html

(cl:defclass <ConfigManualDriveStroke> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (run
    :reader run
    :initarg :run
    :type cl:boolean
    :initform cl:nil)
   (drive_stroke
    :reader drive_stroke
    :initarg :drive_stroke
    :type cl:float
    :initform 0.0)
   (brake_stroke
    :reader brake_stroke
    :initarg :brake_stroke
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigManualDriveStroke (<ConfigManualDriveStroke>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigManualDriveStroke>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigManualDriveStroke)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigManualDriveStroke> is deprecated: use autoware_config_msgs-msg:ConfigManualDriveStroke instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigManualDriveStroke>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'run-val :lambda-list '(m))
(cl:defmethod run-val ((m <ConfigManualDriveStroke>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:run-val is deprecated.  Use autoware_config_msgs-msg:run instead.")
  (run m))

(cl:ensure-generic-function 'drive_stroke-val :lambda-list '(m))
(cl:defmethod drive_stroke-val ((m <ConfigManualDriveStroke>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:drive_stroke-val is deprecated.  Use autoware_config_msgs-msg:drive_stroke instead.")
  (drive_stroke m))

(cl:ensure-generic-function 'brake_stroke-val :lambda-list '(m))
(cl:defmethod brake_stroke-val ((m <ConfigManualDriveStroke>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:brake_stroke-val is deprecated.  Use autoware_config_msgs-msg:brake_stroke instead.")
  (brake_stroke m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigManualDriveStroke>) ostream)
  "Serializes a message object of type '<ConfigManualDriveStroke>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'run) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'drive_stroke))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'brake_stroke))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigManualDriveStroke>) istream)
  "Deserializes a message object of type '<ConfigManualDriveStroke>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'run) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'drive_stroke) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_stroke) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigManualDriveStroke>)))
  "Returns string type for a message object of type '<ConfigManualDriveStroke>"
  "autoware_config_msgs/ConfigManualDriveStroke")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigManualDriveStroke)))
  "Returns string type for a message object of type 'ConfigManualDriveStroke"
  "autoware_config_msgs/ConfigManualDriveStroke")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigManualDriveStroke>)))
  "Returns md5sum for a message object of type '<ConfigManualDriveStroke>"
  "ac436a8678a2221c76afb687b9d38a53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigManualDriveStroke)))
  "Returns md5sum for a message object of type 'ConfigManualDriveStroke"
  "ac436a8678a2221c76afb687b9d38a53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigManualDriveStroke>)))
  "Returns full string definition for message of type '<ConfigManualDriveStroke>"
  (cl:format cl:nil "Header header~%bool run~%float64 drive_stroke~%float64 brake_stroke~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigManualDriveStroke)))
  "Returns full string definition for message of type 'ConfigManualDriveStroke"
  (cl:format cl:nil "Header header~%bool run~%float64 drive_stroke~%float64 brake_stroke~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigManualDriveStroke>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigManualDriveStroke>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigManualDriveStroke
    (cl:cons ':header (header msg))
    (cl:cons ':run (run msg))
    (cl:cons ':drive_stroke (drive_stroke msg))
    (cl:cons ':brake_stroke (brake_stroke msg))
))
