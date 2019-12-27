; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude NdtPoseAndRTKPose.msg.html

(cl:defclass <NdtPoseAndRTKPose> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ndt_pose
    :reader ndt_pose
    :initarg :ndt_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (ndt_localizer_pose
    :reader ndt_localizer_pose
    :initarg :ndt_localizer_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (ndt_twist
    :reader ndt_twist
    :initarg :ndt_twist
    :type geometry_msgs-msg:TwistStamped
    :initform (cl:make-instance 'geometry_msgs-msg:TwistStamped))
   (RTK_pose
    :reader RTK_pose
    :initarg :RTK_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (RTK_localizer_pose
    :reader RTK_localizer_pose
    :initarg :RTK_localizer_pose
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (RTK_standard_deviation
    :reader RTK_standard_deviation
    :initarg :RTK_standard_deviation
    :type autoware_msgs-msg:GnssStandardDeviation
    :initform (cl:make-instance 'autoware_msgs-msg:GnssStandardDeviation))
   (ndt_stat
    :reader ndt_stat
    :initarg :ndt_stat
    :type autoware_msgs-msg:NDTStat
    :initform (cl:make-instance 'autoware_msgs-msg:NDTStat)))
)

(cl:defclass NdtPoseAndRTKPose (<NdtPoseAndRTKPose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NdtPoseAndRTKPose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NdtPoseAndRTKPose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<NdtPoseAndRTKPose> is deprecated: use autoware_msgs-msg:NdtPoseAndRTKPose instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ndt_pose-val :lambda-list '(m))
(cl:defmethod ndt_pose-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:ndt_pose-val is deprecated.  Use autoware_msgs-msg:ndt_pose instead.")
  (ndt_pose m))

(cl:ensure-generic-function 'ndt_localizer_pose-val :lambda-list '(m))
(cl:defmethod ndt_localizer_pose-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:ndt_localizer_pose-val is deprecated.  Use autoware_msgs-msg:ndt_localizer_pose instead.")
  (ndt_localizer_pose m))

(cl:ensure-generic-function 'ndt_twist-val :lambda-list '(m))
(cl:defmethod ndt_twist-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:ndt_twist-val is deprecated.  Use autoware_msgs-msg:ndt_twist instead.")
  (ndt_twist m))

(cl:ensure-generic-function 'RTK_pose-val :lambda-list '(m))
(cl:defmethod RTK_pose-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:RTK_pose-val is deprecated.  Use autoware_msgs-msg:RTK_pose instead.")
  (RTK_pose m))

(cl:ensure-generic-function 'RTK_localizer_pose-val :lambda-list '(m))
(cl:defmethod RTK_localizer_pose-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:RTK_localizer_pose-val is deprecated.  Use autoware_msgs-msg:RTK_localizer_pose instead.")
  (RTK_localizer_pose m))

(cl:ensure-generic-function 'RTK_standard_deviation-val :lambda-list '(m))
(cl:defmethod RTK_standard_deviation-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:RTK_standard_deviation-val is deprecated.  Use autoware_msgs-msg:RTK_standard_deviation instead.")
  (RTK_standard_deviation m))

(cl:ensure-generic-function 'ndt_stat-val :lambda-list '(m))
(cl:defmethod ndt_stat-val ((m <NdtPoseAndRTKPose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:ndt_stat-val is deprecated.  Use autoware_msgs-msg:ndt_stat instead.")
  (ndt_stat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NdtPoseAndRTKPose>) ostream)
  "Serializes a message object of type '<NdtPoseAndRTKPose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ndt_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ndt_localizer_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ndt_twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RTK_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RTK_localizer_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RTK_standard_deviation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ndt_stat) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NdtPoseAndRTKPose>) istream)
  "Deserializes a message object of type '<NdtPoseAndRTKPose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ndt_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ndt_localizer_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ndt_twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RTK_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RTK_localizer_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RTK_standard_deviation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ndt_stat) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NdtPoseAndRTKPose>)))
  "Returns string type for a message object of type '<NdtPoseAndRTKPose>"
  "autoware_msgs/NdtPoseAndRTKPose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NdtPoseAndRTKPose)))
  "Returns string type for a message object of type 'NdtPoseAndRTKPose"
  "autoware_msgs/NdtPoseAndRTKPose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NdtPoseAndRTKPose>)))
  "Returns md5sum for a message object of type '<NdtPoseAndRTKPose>"
  "04033cc2ccf6e18ada42ff3baad16dfb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NdtPoseAndRTKPose)))
  "Returns md5sum for a message object of type 'NdtPoseAndRTKPose"
  "04033cc2ccf6e18ada42ff3baad16dfb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NdtPoseAndRTKPose>)))
  "Returns full string definition for message of type '<NdtPoseAndRTKPose>"
  (cl:format cl:nil "Header header~%geometry_msgs/PoseStamped ndt_pose~%geometry_msgs/PoseStamped ndt_localizer_pose~%geometry_msgs/TwistStamped ndt_twist~%geometry_msgs/PoseStamped RTK_pose~%geometry_msgs/PoseStamped RTK_localizer_pose~%autoware_msgs/GnssStandardDeviation RTK_standard_deviation~%autoware_msgs/NDTStat ndt_stat~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: autoware_msgs/GnssStandardDeviation~%Header header~%float64 lat_std~%float64 lon_std~%float64 alt_std~%~%================================================================================~%MSG: autoware_msgs/NDTStat~%Header header~%float32 exe_time~%int32 iteration~%float32 score~%float32 velocity~%float32 acceleration~%int32 use_predict_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NdtPoseAndRTKPose)))
  "Returns full string definition for message of type 'NdtPoseAndRTKPose"
  (cl:format cl:nil "Header header~%geometry_msgs/PoseStamped ndt_pose~%geometry_msgs/PoseStamped ndt_localizer_pose~%geometry_msgs/TwistStamped ndt_twist~%geometry_msgs/PoseStamped RTK_pose~%geometry_msgs/PoseStamped RTK_localizer_pose~%autoware_msgs/GnssStandardDeviation RTK_standard_deviation~%autoware_msgs/NDTStat ndt_stat~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistStamped~%# A twist with reference coordinate frame and timestamp~%Header header~%Twist twist~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: autoware_msgs/GnssStandardDeviation~%Header header~%float64 lat_std~%float64 lon_std~%float64 alt_std~%~%================================================================================~%MSG: autoware_msgs/NDTStat~%Header header~%float32 exe_time~%int32 iteration~%float32 score~%float32 velocity~%float32 acceleration~%int32 use_predict_pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NdtPoseAndRTKPose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ndt_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ndt_localizer_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ndt_twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RTK_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RTK_localizer_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RTK_standard_deviation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ndt_stat))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NdtPoseAndRTKPose>))
  "Converts a ROS message object to a list"
  (cl:list 'NdtPoseAndRTKPose
    (cl:cons ':header (header msg))
    (cl:cons ':ndt_pose (ndt_pose msg))
    (cl:cons ':ndt_localizer_pose (ndt_localizer_pose msg))
    (cl:cons ':ndt_twist (ndt_twist msg))
    (cl:cons ':RTK_pose (RTK_pose msg))
    (cl:cons ':RTK_localizer_pose (RTK_localizer_pose msg))
    (cl:cons ':RTK_standard_deviation (RTK_standard_deviation msg))
    (cl:cons ':ndt_stat (ndt_stat msg))
))
