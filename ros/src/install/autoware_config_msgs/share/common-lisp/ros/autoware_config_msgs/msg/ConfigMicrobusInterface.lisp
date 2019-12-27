; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigMicrobusInterface.msg.html

(cl:defclass <ConfigMicrobusInterface> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (check_distance_th
    :reader check_distance_th
    :initarg :check_distance_th
    :type cl:float
    :initform 0.0)
   (check_angular_th
    :reader check_angular_th
    :initarg :check_angular_th
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigMicrobusInterface (<ConfigMicrobusInterface>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigMicrobusInterface>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigMicrobusInterface)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigMicrobusInterface> is deprecated: use autoware_config_msgs-msg:ConfigMicrobusInterface instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigMicrobusInterface>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'check_distance_th-val :lambda-list '(m))
(cl:defmethod check_distance_th-val ((m <ConfigMicrobusInterface>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:check_distance_th-val is deprecated.  Use autoware_config_msgs-msg:check_distance_th instead.")
  (check_distance_th m))

(cl:ensure-generic-function 'check_angular_th-val :lambda-list '(m))
(cl:defmethod check_angular_th-val ((m <ConfigMicrobusInterface>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:check_angular_th-val is deprecated.  Use autoware_config_msgs-msg:check_angular_th instead.")
  (check_angular_th m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigMicrobusInterface>) ostream)
  "Serializes a message object of type '<ConfigMicrobusInterface>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'check_distance_th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'check_angular_th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigMicrobusInterface>) istream)
  "Deserializes a message object of type '<ConfigMicrobusInterface>"
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
    (cl:setf (cl:slot-value msg 'check_distance_th) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'check_angular_th) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigMicrobusInterface>)))
  "Returns string type for a message object of type '<ConfigMicrobusInterface>"
  "autoware_config_msgs/ConfigMicrobusInterface")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigMicrobusInterface)))
  "Returns string type for a message object of type 'ConfigMicrobusInterface"
  "autoware_config_msgs/ConfigMicrobusInterface")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigMicrobusInterface>)))
  "Returns md5sum for a message object of type '<ConfigMicrobusInterface>"
  "49c0dc484a02daa8ec01ed5e3ccd0ed6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigMicrobusInterface)))
  "Returns md5sum for a message object of type 'ConfigMicrobusInterface"
  "49c0dc484a02daa8ec01ed5e3ccd0ed6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigMicrobusInterface>)))
  "Returns full string definition for message of type '<ConfigMicrobusInterface>"
  (cl:format cl:nil "Header header~%float64 check_distance_th~%float64 check_angular_th~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigMicrobusInterface)))
  "Returns full string definition for message of type 'ConfigMicrobusInterface"
  (cl:format cl:nil "Header header~%float64 check_distance_th~%float64 check_angular_th~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigMicrobusInterface>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigMicrobusInterface>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigMicrobusInterface
    (cl:cons ':header (header msg))
    (cl:cons ':check_distance_th (check_distance_th msg))
    (cl:cons ':check_angular_th (check_angular_th msg))
))
