; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude Format7Info.msg.html

(cl:defclass <Format7Info> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (mode
    :reader mode
    :initarg :mode
    :type cl:integer
    :initform 0)
   (max_width
    :reader max_width
    :initarg :max_width
    :type cl:integer
    :initform 0)
   (max_height
    :reader max_height
    :initarg :max_height
    :type cl:integer
    :initform 0)
   (offset_hstep_size
    :reader offset_hstep_size
    :initarg :offset_hstep_size
    :type cl:integer
    :initform 0)
   (offset_vstep_size
    :reader offset_vstep_size
    :initarg :offset_vstep_size
    :type cl:integer
    :initform 0)
   (image_hstep_size
    :reader image_hstep_size
    :initarg :image_hstep_size
    :type cl:integer
    :initform 0)
   (image_vstep_size
    :reader image_vstep_size
    :initarg :image_vstep_size
    :type cl:integer
    :initform 0)
   (pixel_format_bit_field
    :reader pixel_format_bit_field
    :initarg :pixel_format_bit_field
    :type cl:integer
    :initform 0)
   (vendor_pixel_format_bit_field
    :reader vendor_pixel_format_bit_field
    :initarg :vendor_pixel_format_bit_field
    :type cl:integer
    :initform 0)
   (packet_size
    :reader packet_size
    :initarg :packet_size
    :type cl:integer
    :initform 0)
   (min_packet_size
    :reader min_packet_size
    :initarg :min_packet_size
    :type cl:integer
    :initform 0)
   (max_packet_size
    :reader max_packet_size
    :initarg :max_packet_size
    :type cl:integer
    :initform 0)
   (percentage
    :reader percentage
    :initarg :percentage
    :type cl:integer
    :initform 0))
)

(cl:defclass Format7Info (<Format7Info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Format7Info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Format7Info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<Format7Info> is deprecated: use autoware_msgs-msg:Format7Info instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:mode-val is deprecated.  Use autoware_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'max_width-val :lambda-list '(m))
(cl:defmethod max_width-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:max_width-val is deprecated.  Use autoware_msgs-msg:max_width instead.")
  (max_width m))

(cl:ensure-generic-function 'max_height-val :lambda-list '(m))
(cl:defmethod max_height-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:max_height-val is deprecated.  Use autoware_msgs-msg:max_height instead.")
  (max_height m))

(cl:ensure-generic-function 'offset_hstep_size-val :lambda-list '(m))
(cl:defmethod offset_hstep_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:offset_hstep_size-val is deprecated.  Use autoware_msgs-msg:offset_hstep_size instead.")
  (offset_hstep_size m))

(cl:ensure-generic-function 'offset_vstep_size-val :lambda-list '(m))
(cl:defmethod offset_vstep_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:offset_vstep_size-val is deprecated.  Use autoware_msgs-msg:offset_vstep_size instead.")
  (offset_vstep_size m))

(cl:ensure-generic-function 'image_hstep_size-val :lambda-list '(m))
(cl:defmethod image_hstep_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:image_hstep_size-val is deprecated.  Use autoware_msgs-msg:image_hstep_size instead.")
  (image_hstep_size m))

(cl:ensure-generic-function 'image_vstep_size-val :lambda-list '(m))
(cl:defmethod image_vstep_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:image_vstep_size-val is deprecated.  Use autoware_msgs-msg:image_vstep_size instead.")
  (image_vstep_size m))

(cl:ensure-generic-function 'pixel_format_bit_field-val :lambda-list '(m))
(cl:defmethod pixel_format_bit_field-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:pixel_format_bit_field-val is deprecated.  Use autoware_msgs-msg:pixel_format_bit_field instead.")
  (pixel_format_bit_field m))

(cl:ensure-generic-function 'vendor_pixel_format_bit_field-val :lambda-list '(m))
(cl:defmethod vendor_pixel_format_bit_field-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:vendor_pixel_format_bit_field-val is deprecated.  Use autoware_msgs-msg:vendor_pixel_format_bit_field instead.")
  (vendor_pixel_format_bit_field m))

(cl:ensure-generic-function 'packet_size-val :lambda-list '(m))
(cl:defmethod packet_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:packet_size-val is deprecated.  Use autoware_msgs-msg:packet_size instead.")
  (packet_size m))

(cl:ensure-generic-function 'min_packet_size-val :lambda-list '(m))
(cl:defmethod min_packet_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:min_packet_size-val is deprecated.  Use autoware_msgs-msg:min_packet_size instead.")
  (min_packet_size m))

(cl:ensure-generic-function 'max_packet_size-val :lambda-list '(m))
(cl:defmethod max_packet_size-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:max_packet_size-val is deprecated.  Use autoware_msgs-msg:max_packet_size instead.")
  (max_packet_size m))

(cl:ensure-generic-function 'percentage-val :lambda-list '(m))
(cl:defmethod percentage-val ((m <Format7Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:percentage-val is deprecated.  Use autoware_msgs-msg:percentage instead.")
  (percentage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Format7Info>) ostream)
  "Serializes a message object of type '<Format7Info>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_hstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_vstep_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vendor_pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vendor_pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'vendor_pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'vendor_pixel_format_bit_field)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'min_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'min_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'min_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'min_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_packet_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'percentage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'percentage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'percentage)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'percentage)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Format7Info>) istream)
  "Deserializes a message object of type '<Format7Info>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'offset_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'offset_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'offset_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'offset_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_hstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'image_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'image_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'image_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'image_vstep_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'vendor_pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'vendor_pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'vendor_pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'vendor_pixel_format_bit_field)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'min_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'min_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'min_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'min_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'max_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'max_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'max_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'max_packet_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'percentage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'percentage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'percentage)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'percentage)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Format7Info>)))
  "Returns string type for a message object of type '<Format7Info>"
  "autoware_msgs/Format7Info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Format7Info)))
  "Returns string type for a message object of type 'Format7Info"
  "autoware_msgs/Format7Info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Format7Info>)))
  "Returns md5sum for a message object of type '<Format7Info>"
  "f0de8958020c19660d6a288bf7b53a83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Format7Info)))
  "Returns md5sum for a message object of type 'Format7Info"
  "f0de8958020c19660d6a288bf7b53a83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Format7Info>)))
  "Returns full string definition for message of type '<Format7Info>"
  (cl:format cl:nil "Header header~%uint32 mode~%uint32 max_width~%uint32 max_height~%uint32 offset_hstep_size~%uint32 offset_vstep_size~%uint32 image_hstep_size~%uint32 image_vstep_size~%uint32 pixel_format_bit_field~%uint32 vendor_pixel_format_bit_field~%uint32 packet_size~%uint32 min_packet_size~%uint32 max_packet_size~%uint32 percentage~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Format7Info)))
  "Returns full string definition for message of type 'Format7Info"
  (cl:format cl:nil "Header header~%uint32 mode~%uint32 max_width~%uint32 max_height~%uint32 offset_hstep_size~%uint32 offset_vstep_size~%uint32 image_hstep_size~%uint32 image_vstep_size~%uint32 pixel_format_bit_field~%uint32 vendor_pixel_format_bit_field~%uint32 packet_size~%uint32 min_packet_size~%uint32 max_packet_size~%uint32 percentage~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Format7Info>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Format7Info>))
  "Converts a ROS message object to a list"
  (cl:list 'Format7Info
    (cl:cons ':header (header msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':max_width (max_width msg))
    (cl:cons ':max_height (max_height msg))
    (cl:cons ':offset_hstep_size (offset_hstep_size msg))
    (cl:cons ':offset_vstep_size (offset_vstep_size msg))
    (cl:cons ':image_hstep_size (image_hstep_size msg))
    (cl:cons ':image_vstep_size (image_vstep_size msg))
    (cl:cons ':pixel_format_bit_field (pixel_format_bit_field msg))
    (cl:cons ':vendor_pixel_format_bit_field (vendor_pixel_format_bit_field msg))
    (cl:cons ':packet_size (packet_size msg))
    (cl:cons ':min_packet_size (min_packet_size msg))
    (cl:cons ':max_packet_size (max_packet_size msg))
    (cl:cons ':percentage (percentage msg))
))
