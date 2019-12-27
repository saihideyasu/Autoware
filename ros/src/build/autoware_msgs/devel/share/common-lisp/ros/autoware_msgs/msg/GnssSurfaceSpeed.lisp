; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude GnssSurfaceSpeed.msg.html

(cl:defclass <GnssSurfaceSpeed> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (surface_speed
    :reader surface_speed
    :initarg :surface_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass GnssSurfaceSpeed (<GnssSurfaceSpeed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GnssSurfaceSpeed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GnssSurfaceSpeed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<GnssSurfaceSpeed> is deprecated: use autoware_msgs-msg:GnssSurfaceSpeed instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GnssSurfaceSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'surface_speed-val :lambda-list '(m))
(cl:defmethod surface_speed-val ((m <GnssSurfaceSpeed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:surface_speed-val is deprecated.  Use autoware_msgs-msg:surface_speed instead.")
  (surface_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GnssSurfaceSpeed>) ostream)
  "Serializes a message object of type '<GnssSurfaceSpeed>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'surface_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GnssSurfaceSpeed>) istream)
  "Deserializes a message object of type '<GnssSurfaceSpeed>"
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
    (cl:setf (cl:slot-value msg 'surface_speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GnssSurfaceSpeed>)))
  "Returns string type for a message object of type '<GnssSurfaceSpeed>"
  "autoware_msgs/GnssSurfaceSpeed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GnssSurfaceSpeed)))
  "Returns string type for a message object of type 'GnssSurfaceSpeed"
  "autoware_msgs/GnssSurfaceSpeed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GnssSurfaceSpeed>)))
  "Returns md5sum for a message object of type '<GnssSurfaceSpeed>"
  "7301732f40a4f47fa1581fe38cd4143d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GnssSurfaceSpeed)))
  "Returns md5sum for a message object of type 'GnssSurfaceSpeed"
  "7301732f40a4f47fa1581fe38cd4143d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GnssSurfaceSpeed>)))
  "Returns full string definition for message of type '<GnssSurfaceSpeed>"
  (cl:format cl:nil "Header header~%float64 surface_speed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GnssSurfaceSpeed)))
  "Returns full string definition for message of type 'GnssSurfaceSpeed"
  (cl:format cl:nil "Header header~%float64 surface_speed~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GnssSurfaceSpeed>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GnssSurfaceSpeed>))
  "Converts a ROS message object to a list"
  (cl:list 'GnssSurfaceSpeed
    (cl:cons ':header (header msg))
    (cl:cons ':surface_speed (surface_speed msg))
))
