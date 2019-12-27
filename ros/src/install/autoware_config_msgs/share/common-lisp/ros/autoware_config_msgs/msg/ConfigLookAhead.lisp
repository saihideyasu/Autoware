; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigLookAhead.msg.html

(cl:defclass <ConfigLookAhead> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lookahead_ratio
    :reader lookahead_ratio
    :initarg :lookahead_ratio
    :type cl:float
    :initform 0.0)
   (minimum_lookahead_distance
    :reader minimum_lookahead_distance
    :initarg :minimum_lookahead_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigLookAhead (<ConfigLookAhead>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigLookAhead>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigLookAhead)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigLookAhead> is deprecated: use autoware_config_msgs-msg:ConfigLookAhead instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigLookAhead>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lookahead_ratio-val :lambda-list '(m))
(cl:defmethod lookahead_ratio-val ((m <ConfigLookAhead>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:lookahead_ratio-val is deprecated.  Use autoware_config_msgs-msg:lookahead_ratio instead.")
  (lookahead_ratio m))

(cl:ensure-generic-function 'minimum_lookahead_distance-val :lambda-list '(m))
(cl:defmethod minimum_lookahead_distance-val ((m <ConfigLookAhead>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:minimum_lookahead_distance-val is deprecated.  Use autoware_config_msgs-msg:minimum_lookahead_distance instead.")
  (minimum_lookahead_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigLookAhead>) ostream)
  "Serializes a message object of type '<ConfigLookAhead>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lookahead_ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'minimum_lookahead_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigLookAhead>) istream)
  "Deserializes a message object of type '<ConfigLookAhead>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lookahead_ratio) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minimum_lookahead_distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigLookAhead>)))
  "Returns string type for a message object of type '<ConfigLookAhead>"
  "autoware_config_msgs/ConfigLookAhead")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigLookAhead)))
  "Returns string type for a message object of type 'ConfigLookAhead"
  "autoware_config_msgs/ConfigLookAhead")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigLookAhead>)))
  "Returns md5sum for a message object of type '<ConfigLookAhead>"
  "a0bcfee04f0b9a358f42c214f234df83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigLookAhead)))
  "Returns md5sum for a message object of type 'ConfigLookAhead"
  "a0bcfee04f0b9a358f42c214f234df83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigLookAhead>)))
  "Returns full string definition for message of type '<ConfigLookAhead>"
  (cl:format cl:nil "Header header~%float32 lookahead_ratio~%float32 minimum_lookahead_distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigLookAhead)))
  "Returns full string definition for message of type 'ConfigLookAhead"
  (cl:format cl:nil "Header header~%float32 lookahead_ratio~%float32 minimum_lookahead_distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigLookAhead>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigLookAhead>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigLookAhead
    (cl:cons ':header (header msg))
    (cl:cons ':lookahead_ratio (lookahead_ratio msg))
    (cl:cons ':minimum_lookahead_distance (minimum_lookahead_distance msg))
))
