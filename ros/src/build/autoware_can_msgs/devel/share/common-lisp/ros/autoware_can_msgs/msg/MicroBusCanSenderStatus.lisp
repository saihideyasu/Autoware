; Auto-generated. Do not edit!


(cl:in-package autoware_can_msgs-msg)


;//! \htmlinclude MicroBusCanSenderStatus.msg.html

(cl:defclass <MicroBusCanSenderStatus> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (use_position_checker
    :reader use_position_checker
    :initarg :use_position_checker
    :type cl:boolean
    :initform cl:nil)
   (use_input_steer
    :reader use_input_steer
    :initarg :use_input_steer
    :type cl:boolean
    :initform cl:nil)
   (use_input_drive
    :reader use_input_drive
    :initarg :use_input_drive
    :type cl:boolean
    :initform cl:nil)
   (use_velocity_topic
    :reader use_velocity_topic
    :initarg :use_velocity_topic
    :type cl:fixnum
    :initform 0)
   (position_check_stop
    :reader position_check_stop
    :initarg :position_check_stop
    :type cl:boolean
    :initform cl:nil)
   (angle_limit_over
    :reader angle_limit_over
    :initarg :angle_limit_over
    :type cl:boolean
    :initform cl:nil)
   (safety_error_message
    :reader safety_error_message
    :initarg :safety_error_message
    :type cl:string
    :initform ""))
)

(cl:defclass MicroBusCanSenderStatus (<MicroBusCanSenderStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MicroBusCanSenderStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MicroBusCanSenderStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_can_msgs-msg:<MicroBusCanSenderStatus> is deprecated: use autoware_can_msgs-msg:MicroBusCanSenderStatus instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:header-val is deprecated.  Use autoware_can_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'use_position_checker-val :lambda-list '(m))
(cl:defmethod use_position_checker-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:use_position_checker-val is deprecated.  Use autoware_can_msgs-msg:use_position_checker instead.")
  (use_position_checker m))

(cl:ensure-generic-function 'use_input_steer-val :lambda-list '(m))
(cl:defmethod use_input_steer-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:use_input_steer-val is deprecated.  Use autoware_can_msgs-msg:use_input_steer instead.")
  (use_input_steer m))

(cl:ensure-generic-function 'use_input_drive-val :lambda-list '(m))
(cl:defmethod use_input_drive-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:use_input_drive-val is deprecated.  Use autoware_can_msgs-msg:use_input_drive instead.")
  (use_input_drive m))

(cl:ensure-generic-function 'use_velocity_topic-val :lambda-list '(m))
(cl:defmethod use_velocity_topic-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:use_velocity_topic-val is deprecated.  Use autoware_can_msgs-msg:use_velocity_topic instead.")
  (use_velocity_topic m))

(cl:ensure-generic-function 'position_check_stop-val :lambda-list '(m))
(cl:defmethod position_check_stop-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:position_check_stop-val is deprecated.  Use autoware_can_msgs-msg:position_check_stop instead.")
  (position_check_stop m))

(cl:ensure-generic-function 'angle_limit_over-val :lambda-list '(m))
(cl:defmethod angle_limit_over-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:angle_limit_over-val is deprecated.  Use autoware_can_msgs-msg:angle_limit_over instead.")
  (angle_limit_over m))

(cl:ensure-generic-function 'safety_error_message-val :lambda-list '(m))
(cl:defmethod safety_error_message-val ((m <MicroBusCanSenderStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_can_msgs-msg:safety_error_message-val is deprecated.  Use autoware_can_msgs-msg:safety_error_message instead.")
  (safety_error_message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MicroBusCanSenderStatus>) ostream)
  "Serializes a message object of type '<MicroBusCanSenderStatus>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_position_checker) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_input_steer) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'use_input_drive) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'use_velocity_topic)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'position_check_stop) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'angle_limit_over) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'safety_error_message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'safety_error_message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MicroBusCanSenderStatus>) istream)
  "Deserializes a message object of type '<MicroBusCanSenderStatus>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'use_position_checker) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'use_input_steer) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'use_input_drive) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'use_velocity_topic) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'position_check_stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'angle_limit_over) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'safety_error_message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'safety_error_message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MicroBusCanSenderStatus>)))
  "Returns string type for a message object of type '<MicroBusCanSenderStatus>"
  "autoware_can_msgs/MicroBusCanSenderStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MicroBusCanSenderStatus)))
  "Returns string type for a message object of type 'MicroBusCanSenderStatus"
  "autoware_can_msgs/MicroBusCanSenderStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MicroBusCanSenderStatus>)))
  "Returns md5sum for a message object of type '<MicroBusCanSenderStatus>"
  "8e657452a5005d3b21b85259e5ca2de3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MicroBusCanSenderStatus)))
  "Returns md5sum for a message object of type 'MicroBusCanSenderStatus"
  "8e657452a5005d3b21b85259e5ca2de3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MicroBusCanSenderStatus>)))
  "Returns full string definition for message of type '<MicroBusCanSenderStatus>"
  (cl:format cl:nil "Header header~%bool use_position_checker~%bool use_input_steer~%bool use_input_drive~%int8 use_velocity_topic~%bool position_check_stop~%bool angle_limit_over~%string safety_error_message~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MicroBusCanSenderStatus)))
  "Returns full string definition for message of type 'MicroBusCanSenderStatus"
  (cl:format cl:nil "Header header~%bool use_position_checker~%bool use_input_steer~%bool use_input_drive~%int8 use_velocity_topic~%bool position_check_stop~%bool angle_limit_over~%string safety_error_message~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MicroBusCanSenderStatus>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     1
     1
     1
     1
     4 (cl:length (cl:slot-value msg 'safety_error_message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MicroBusCanSenderStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'MicroBusCanSenderStatus
    (cl:cons ':header (header msg))
    (cl:cons ':use_position_checker (use_position_checker msg))
    (cl:cons ':use_input_steer (use_input_steer msg))
    (cl:cons ':use_input_drive (use_input_drive msg))
    (cl:cons ':use_velocity_topic (use_velocity_topic msg))
    (cl:cons ':position_check_stop (position_check_stop msg))
    (cl:cons ':angle_limit_over (angle_limit_over msg))
    (cl:cons ':safety_error_message (safety_error_message msg))
))
