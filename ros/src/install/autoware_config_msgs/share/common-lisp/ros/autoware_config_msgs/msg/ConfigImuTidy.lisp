; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigImuTidy.msg.html

(cl:defclass <ConfigImuTidy> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lowpass_filter_weight
    :reader lowpass_filter_weight
    :initarg :lowpass_filter_weight
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigImuTidy (<ConfigImuTidy>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigImuTidy>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigImuTidy)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigImuTidy> is deprecated: use autoware_config_msgs-msg:ConfigImuTidy instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigImuTidy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lowpass_filter_weight-val :lambda-list '(m))
(cl:defmethod lowpass_filter_weight-val ((m <ConfigImuTidy>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:lowpass_filter_weight-val is deprecated.  Use autoware_config_msgs-msg:lowpass_filter_weight instead.")
  (lowpass_filter_weight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigImuTidy>) ostream)
  "Serializes a message object of type '<ConfigImuTidy>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lowpass_filter_weight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigImuTidy>) istream)
  "Deserializes a message object of type '<ConfigImuTidy>"
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
    (cl:setf (cl:slot-value msg 'lowpass_filter_weight) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigImuTidy>)))
  "Returns string type for a message object of type '<ConfigImuTidy>"
  "autoware_config_msgs/ConfigImuTidy")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigImuTidy)))
  "Returns string type for a message object of type 'ConfigImuTidy"
  "autoware_config_msgs/ConfigImuTidy")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigImuTidy>)))
  "Returns md5sum for a message object of type '<ConfigImuTidy>"
  "476d31d2c910cd7236e351b47ec67fcd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigImuTidy)))
  "Returns md5sum for a message object of type 'ConfigImuTidy"
  "476d31d2c910cd7236e351b47ec67fcd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigImuTidy>)))
  "Returns full string definition for message of type '<ConfigImuTidy>"
  (cl:format cl:nil "Header header~%float64 lowpass_filter_weight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigImuTidy)))
  "Returns full string definition for message of type 'ConfigImuTidy"
  (cl:format cl:nil "Header header~%float64 lowpass_filter_weight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigImuTidy>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigImuTidy>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigImuTidy
    (cl:cons ':header (header msg))
    (cl:cons ':lowpass_filter_weight (lowpass_filter_weight msg))
))
