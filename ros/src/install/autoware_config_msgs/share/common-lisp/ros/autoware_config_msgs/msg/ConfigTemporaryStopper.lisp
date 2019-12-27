; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigTemporaryStopper.msg.html

(cl:defclass <ConfigTemporaryStopper> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (search_distance
    :reader search_distance
    :initarg :search_distance
    :type cl:float
    :initform 0.0)
   (acceleration
    :reader acceleration
    :initarg :acceleration
    :type cl:float
    :initform 0.0)
   (number_of_zeros_ahead
    :reader number_of_zeros_ahead
    :initarg :number_of_zeros_ahead
    :type cl:integer
    :initform 0)
   (number_of_zeros_behind
    :reader number_of_zeros_behind
    :initarg :number_of_zeros_behind
    :type cl:integer
    :initform 0)
   (stop_speed_threshold
    :reader stop_speed_threshold
    :initarg :stop_speed_threshold
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConfigTemporaryStopper (<ConfigTemporaryStopper>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigTemporaryStopper>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigTemporaryStopper)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigTemporaryStopper> is deprecated: use autoware_config_msgs-msg:ConfigTemporaryStopper instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'search_distance-val :lambda-list '(m))
(cl:defmethod search_distance-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:search_distance-val is deprecated.  Use autoware_config_msgs-msg:search_distance instead.")
  (search_distance m))

(cl:ensure-generic-function 'acceleration-val :lambda-list '(m))
(cl:defmethod acceleration-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:acceleration-val is deprecated.  Use autoware_config_msgs-msg:acceleration instead.")
  (acceleration m))

(cl:ensure-generic-function 'number_of_zeros_ahead-val :lambda-list '(m))
(cl:defmethod number_of_zeros_ahead-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:number_of_zeros_ahead-val is deprecated.  Use autoware_config_msgs-msg:number_of_zeros_ahead instead.")
  (number_of_zeros_ahead m))

(cl:ensure-generic-function 'number_of_zeros_behind-val :lambda-list '(m))
(cl:defmethod number_of_zeros_behind-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:number_of_zeros_behind-val is deprecated.  Use autoware_config_msgs-msg:number_of_zeros_behind instead.")
  (number_of_zeros_behind m))

(cl:ensure-generic-function 'stop_speed_threshold-val :lambda-list '(m))
(cl:defmethod stop_speed_threshold-val ((m <ConfigTemporaryStopper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:stop_speed_threshold-val is deprecated.  Use autoware_config_msgs-msg:stop_speed_threshold instead.")
  (stop_speed_threshold m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigTemporaryStopper>) ostream)
  "Serializes a message object of type '<ConfigTemporaryStopper>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'search_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'number_of_zeros_ahead)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'number_of_zeros_behind)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'stop_speed_threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigTemporaryStopper>) istream)
  "Deserializes a message object of type '<ConfigTemporaryStopper>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'search_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_of_zeros_ahead) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_of_zeros_behind) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stop_speed_threshold) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigTemporaryStopper>)))
  "Returns string type for a message object of type '<ConfigTemporaryStopper>"
  "autoware_config_msgs/ConfigTemporaryStopper")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigTemporaryStopper)))
  "Returns string type for a message object of type 'ConfigTemporaryStopper"
  "autoware_config_msgs/ConfigTemporaryStopper")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigTemporaryStopper>)))
  "Returns md5sum for a message object of type '<ConfigTemporaryStopper>"
  "539a543caae5914ad6ee1ae5741c9991")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigTemporaryStopper)))
  "Returns md5sum for a message object of type 'ConfigTemporaryStopper"
  "539a543caae5914ad6ee1ae5741c9991")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigTemporaryStopper>)))
  "Returns full string definition for message of type '<ConfigTemporaryStopper>"
  (cl:format cl:nil "Header header~%float32 search_distance~%float32 acceleration~%int32 number_of_zeros_ahead~%int32 number_of_zeros_behind~%float64 stop_speed_threshold~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigTemporaryStopper)))
  "Returns full string definition for message of type 'ConfigTemporaryStopper"
  (cl:format cl:nil "Header header~%float32 search_distance~%float32 acceleration~%int32 number_of_zeros_ahead~%int32 number_of_zeros_behind~%float64 stop_speed_threshold~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigTemporaryStopper>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigTemporaryStopper>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigTemporaryStopper
    (cl:cons ':header (header msg))
    (cl:cons ':search_distance (search_distance msg))
    (cl:cons ':acceleration (acceleration msg))
    (cl:cons ':number_of_zeros_ahead (number_of_zeros_ahead msg))
    (cl:cons ':number_of_zeros_behind (number_of_zeros_behind msg))
    (cl:cons ':stop_speed_threshold (stop_speed_threshold msg))
))
