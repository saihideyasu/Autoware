; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude PositionChecker.msg.html

(cl:defclass <PositionChecker> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (stop_flag
    :reader stop_flag
    :initarg :stop_flag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PositionChecker (<PositionChecker>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionChecker>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionChecker)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<PositionChecker> is deprecated: use autoware_msgs-msg:PositionChecker instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <PositionChecker>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'stop_flag-val :lambda-list '(m))
(cl:defmethod stop_flag-val ((m <PositionChecker>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:stop_flag-val is deprecated.  Use autoware_msgs-msg:stop_flag instead.")
  (stop_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionChecker>) ostream)
  "Serializes a message object of type '<PositionChecker>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'stop_flag)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionChecker>) istream)
  "Deserializes a message object of type '<PositionChecker>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'stop_flag)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionChecker>)))
  "Returns string type for a message object of type '<PositionChecker>"
  "autoware_msgs/PositionChecker")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionChecker)))
  "Returns string type for a message object of type 'PositionChecker"
  "autoware_msgs/PositionChecker")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionChecker>)))
  "Returns md5sum for a message object of type '<PositionChecker>"
  "11c5390e6a4faae76625ae9d933f0b42")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionChecker)))
  "Returns md5sum for a message object of type 'PositionChecker"
  "11c5390e6a4faae76625ae9d933f0b42")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionChecker>)))
  "Returns full string definition for message of type '<PositionChecker>"
  (cl:format cl:nil "Header header~%uint8 stop_flag~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionChecker)))
  "Returns full string definition for message of type 'PositionChecker"
  (cl:format cl:nil "Header header~%uint8 stop_flag~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionChecker>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionChecker>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionChecker
    (cl:cons ':header (header msg))
    (cl:cons ':stop_flag (stop_flag msg))
))
