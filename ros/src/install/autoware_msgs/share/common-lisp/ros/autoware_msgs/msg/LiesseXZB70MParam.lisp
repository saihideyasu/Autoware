; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude LiesseXZB70MParam.msg.html

(cl:defclass <LiesseXZB70MParam> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (shift
    :reader shift
    :initarg :shift
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LiesseXZB70MParam (<LiesseXZB70MParam>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LiesseXZB70MParam>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LiesseXZB70MParam)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<LiesseXZB70MParam> is deprecated: use autoware_msgs-msg:LiesseXZB70MParam instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LiesseXZB70MParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'shift-val :lambda-list '(m))
(cl:defmethod shift-val ((m <LiesseXZB70MParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:shift-val is deprecated.  Use autoware_msgs-msg:shift instead.")
  (shift m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<LiesseXZB70MParam>)))
    "Constants for message type '<LiesseXZB70MParam>"
  '((:SHIFT_P . 0)
    (:SHIFT_R . 1)
    (:SHIFT_N . 2)
    (:SHIFT_D . 3)
    (:SHIFT_4 . 4)
    (:SHIFT_L . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'LiesseXZB70MParam)))
    "Constants for message type 'LiesseXZB70MParam"
  '((:SHIFT_P . 0)
    (:SHIFT_R . 1)
    (:SHIFT_N . 2)
    (:SHIFT_D . 3)
    (:SHIFT_4 . 4)
    (:SHIFT_L . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LiesseXZB70MParam>) ostream)
  "Serializes a message object of type '<LiesseXZB70MParam>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'shift)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LiesseXZB70MParam>) istream)
  "Deserializes a message object of type '<LiesseXZB70MParam>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'shift) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LiesseXZB70MParam>)))
  "Returns string type for a message object of type '<LiesseXZB70MParam>"
  "autoware_msgs/LiesseXZB70MParam")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LiesseXZB70MParam)))
  "Returns string type for a message object of type 'LiesseXZB70MParam"
  "autoware_msgs/LiesseXZB70MParam")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LiesseXZB70MParam>)))
  "Returns md5sum for a message object of type '<LiesseXZB70MParam>"
  "299d9ca4a0f481002204559fa398d19d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LiesseXZB70MParam)))
  "Returns md5sum for a message object of type 'LiesseXZB70MParam"
  "299d9ca4a0f481002204559fa398d19d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LiesseXZB70MParam>)))
  "Returns full string definition for message of type '<LiesseXZB70MParam>"
  (cl:format cl:nil "Header header~%int8 SHIFT_P = 0~%int8 SHIFT_R = 1~%int8 SHIFT_N = 2~%int8 SHIFT_D = 3~%int8 SHIFT_4 = 4~%int8 SHIFT_L = 5~%int8 shift~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LiesseXZB70MParam)))
  "Returns full string definition for message of type 'LiesseXZB70MParam"
  (cl:format cl:nil "Header header~%int8 SHIFT_P = 0~%int8 SHIFT_R = 1~%int8 SHIFT_N = 2~%int8 SHIFT_D = 3~%int8 SHIFT_4 = 4~%int8 SHIFT_L = 5~%int8 shift~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LiesseXZB70MParam>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LiesseXZB70MParam>))
  "Converts a ROS message object to a list"
  (cl:list 'LiesseXZB70MParam
    (cl:cons ':header (header msg))
    (cl:cons ':shift (shift msg))
))
