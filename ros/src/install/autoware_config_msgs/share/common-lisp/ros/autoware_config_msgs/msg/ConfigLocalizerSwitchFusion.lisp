; Auto-generated. Do not edit!


(cl:in-package autoware_config_msgs-msg)


;//! \htmlinclude ConfigLocalizerSwitchFusion.msg.html

(cl:defclass <ConfigLocalizerSwitchFusion> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fusion_select
    :reader fusion_select
    :initarg :fusion_select
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ConfigLocalizerSwitchFusion (<ConfigLocalizerSwitchFusion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConfigLocalizerSwitchFusion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConfigLocalizerSwitchFusion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_config_msgs-msg:<ConfigLocalizerSwitchFusion> is deprecated: use autoware_config_msgs-msg:ConfigLocalizerSwitchFusion instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ConfigLocalizerSwitchFusion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:header-val is deprecated.  Use autoware_config_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'fusion_select-val :lambda-list '(m))
(cl:defmethod fusion_select-val ((m <ConfigLocalizerSwitchFusion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_config_msgs-msg:fusion_select-val is deprecated.  Use autoware_config_msgs-msg:fusion_select instead.")
  (fusion_select m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConfigLocalizerSwitchFusion>) ostream)
  "Serializes a message object of type '<ConfigLocalizerSwitchFusion>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fusion_select)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConfigLocalizerSwitchFusion>) istream)
  "Deserializes a message object of type '<ConfigLocalizerSwitchFusion>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fusion_select)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConfigLocalizerSwitchFusion>)))
  "Returns string type for a message object of type '<ConfigLocalizerSwitchFusion>"
  "autoware_config_msgs/ConfigLocalizerSwitchFusion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConfigLocalizerSwitchFusion)))
  "Returns string type for a message object of type 'ConfigLocalizerSwitchFusion"
  "autoware_config_msgs/ConfigLocalizerSwitchFusion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConfigLocalizerSwitchFusion>)))
  "Returns md5sum for a message object of type '<ConfigLocalizerSwitchFusion>"
  "58473b5ebe9487298d7ee7dcf714d641")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConfigLocalizerSwitchFusion)))
  "Returns md5sum for a message object of type 'ConfigLocalizerSwitchFusion"
  "58473b5ebe9487298d7ee7dcf714d641")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConfigLocalizerSwitchFusion>)))
  "Returns full string definition for message of type '<ConfigLocalizerSwitchFusion>"
  (cl:format cl:nil "Header header~%uint8 fusion_select~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConfigLocalizerSwitchFusion)))
  "Returns full string definition for message of type 'ConfigLocalizerSwitchFusion"
  (cl:format cl:nil "Header header~%uint8 fusion_select~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConfigLocalizerSwitchFusion>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConfigLocalizerSwitchFusion>))
  "Converts a ROS message object to a list"
  (cl:list 'ConfigLocalizerSwitchFusion
    (cl:cons ':header (header msg))
    (cl:cons ':fusion_select (fusion_select msg))
))
