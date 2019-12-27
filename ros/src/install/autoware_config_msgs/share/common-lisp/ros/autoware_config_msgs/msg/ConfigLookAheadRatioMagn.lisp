; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigLookAheadRatioMagn.msg.html

(cl:defclass <ConfigLookAheadRatioMagn> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (max_magn
    :reader max_magn
    :initarg :max_magn
    :type cl:float
    :initform 0.0)
   (min_magn
    :reader min_magn
    :initarg :min_magn
    :type cl:float
    :initform 0.0)
   (max_distance
    :reader max_distance
    :initarg :max_distance
    :type cl:float
    :initform 0.0)
   (min_distance
    :reader min_distance
    :initarg :min_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigLookAheadRatioMagn (<ConfigLookAheadRatioMagn>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigLookAheadRatioMagn>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigLookAheadRatioMagn)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigLookAheadRatioMagn> is deprecated: use autoware_config_msgs-msg:ConfigLookAheadRatioMagn instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigLookAheadRatioMagn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'max_magn-val :lambda-list '(m))
(cl:defmethod max_magn-val ((m <ConfigLookAheadRatioMagn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:max_magn-val is deprecated.  Use autoware_config_msgs-msg:max_magn instead.")
  (max_magn m))

(cl:ensure-generic-function 'min_magn-val :lambda-list '(m))
(cl:defmethod min_magn-val ((m <ConfigLookAheadRatioMagn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:min_magn-val is deprecated.  Use autoware_config_msgs-msg:min_magn instead.")
  (min_magn m))

(cl:ensure-generic-function 'max_distance-val :lambda-list '(m))
(cl:defmethod max_distance-val ((m <ConfigLookAheadRatioMagn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:max_distance-val is deprecated.  Use autoware_config_msgs-msg:max_distance instead.")
  (max_distance m))

(cl:ensure-generic-function 'min_distance-val :lambda-list '(m))
(cl:defmethod min_distance-val ((m <ConfigLookAheadRatioMagn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:min_distance-val is deprecated.  Use autoware_config_msgs-msg:min_distance instead.")
  (min_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigLookAheadRatioMagn>) ostream)
  "Serializes a message object of type '<ConfigLookAheadRatioMagn>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_magn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_magn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigLookAheadRatioMagn>) istream)
  "Deserializes a message object of type '<ConfigLookAheadRatioMagn>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_magn) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_magn) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_distance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigLookAheadRatioMagn>)))
  "Returns string type for a message object of type '<ConfigLookAheadRatioMagn>"
  "autoware_config_msgs/ConfigLookAheadRatioMagn")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigLookAheadRatioMagn)))
  "Returns string type for a message object of type 'ConfigLookAheadRatioMagn"
  "autoware_config_msgs/ConfigLookAheadRatioMagn")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigLookAheadRatioMagn>)))
  "Returns md5sum for a message object of type '<ConfigLookAheadRatioMagn>"
  "356ebf10bda90af1d28c222d65e16400")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigLookAheadRatioMagn)))
  "Returns md5sum for a message object of type 'ConfigLookAheadRatioMagn"
  "356ebf10bda90af1d28c222d65e16400")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigLookAheadRatioMagn>)))
  "Returns full string definition for message of type '<ConfigLookAheadRatioMagn>"
  (cl:format cl:nil "Header header~%float32 max_magn~%float32 min_magn~%float32 max_distance~%float32 min_distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigLookAheadRatioMagn)))
  "Returns full string definition for message of type 'ConfigLookAheadRatioMagn"
  (cl:format cl:nil "Header header~%float32 max_magn~%float32 min_magn~%float32 max_distance~%float32 min_distance~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigLookAheadRatioMagn>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigLookAheadRatioMagn>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigLookAheadRatioMagn
    (cl:cons ':header (header msg))
    (cl:cons ':max_magn (max_magn msg))
    (cl:cons ':min_magn (min_magn msg))
    (cl:cons ':max_distance (max_distance msg))
    (cl:cons ':min_distance (min_distance msg))
))
