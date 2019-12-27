;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::NdtPoseAndRTKPose)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'NdtPoseAndRTKPose (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::NDTPOSEANDRTKPOSE")
  (make-package "AUTOWARE_MSGS::NDTPOSEANDRTKPOSE"))

(in-package "ROS")
;;//! \htmlinclude NdtPoseAndRTKPose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::NdtPoseAndRTKPose
  :super ros::object
  :slots (_header _ndt_pose _ndt_localizer_pose _ndt_twist _RTK_pose _RTK_localizer_pose _RTK_standard_deviation _ndt_stat ))

(defmethod autoware_msgs::NdtPoseAndRTKPose
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ndt_pose __ndt_pose) (instance geometry_msgs::PoseStamped :init))
    ((:ndt_localizer_pose __ndt_localizer_pose) (instance geometry_msgs::PoseStamped :init))
    ((:ndt_twist __ndt_twist) (instance geometry_msgs::TwistStamped :init))
    ((:RTK_pose __RTK_pose) (instance geometry_msgs::PoseStamped :init))
    ((:RTK_localizer_pose __RTK_localizer_pose) (instance geometry_msgs::PoseStamped :init))
    ((:RTK_standard_deviation __RTK_standard_deviation) (instance autoware_msgs::GnssStandardDeviation :init))
    ((:ndt_stat __ndt_stat) (instance autoware_msgs::NDTStat :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ndt_pose __ndt_pose)
   (setq _ndt_localizer_pose __ndt_localizer_pose)
   (setq _ndt_twist __ndt_twist)
   (setq _RTK_pose __RTK_pose)
   (setq _RTK_localizer_pose __RTK_localizer_pose)
   (setq _RTK_standard_deviation __RTK_standard_deviation)
   (setq _ndt_stat __ndt_stat)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ndt_pose
   (&rest __ndt_pose)
   (if (keywordp (car __ndt_pose))
       (send* _ndt_pose __ndt_pose)
     (progn
       (if __ndt_pose (setq _ndt_pose (car __ndt_pose)))
       _ndt_pose)))
  (:ndt_localizer_pose
   (&rest __ndt_localizer_pose)
   (if (keywordp (car __ndt_localizer_pose))
       (send* _ndt_localizer_pose __ndt_localizer_pose)
     (progn
       (if __ndt_localizer_pose (setq _ndt_localizer_pose (car __ndt_localizer_pose)))
       _ndt_localizer_pose)))
  (:ndt_twist
   (&rest __ndt_twist)
   (if (keywordp (car __ndt_twist))
       (send* _ndt_twist __ndt_twist)
     (progn
       (if __ndt_twist (setq _ndt_twist (car __ndt_twist)))
       _ndt_twist)))
  (:RTK_pose
   (&rest __RTK_pose)
   (if (keywordp (car __RTK_pose))
       (send* _RTK_pose __RTK_pose)
     (progn
       (if __RTK_pose (setq _RTK_pose (car __RTK_pose)))
       _RTK_pose)))
  (:RTK_localizer_pose
   (&rest __RTK_localizer_pose)
   (if (keywordp (car __RTK_localizer_pose))
       (send* _RTK_localizer_pose __RTK_localizer_pose)
     (progn
       (if __RTK_localizer_pose (setq _RTK_localizer_pose (car __RTK_localizer_pose)))
       _RTK_localizer_pose)))
  (:RTK_standard_deviation
   (&rest __RTK_standard_deviation)
   (if (keywordp (car __RTK_standard_deviation))
       (send* _RTK_standard_deviation __RTK_standard_deviation)
     (progn
       (if __RTK_standard_deviation (setq _RTK_standard_deviation (car __RTK_standard_deviation)))
       _RTK_standard_deviation)))
  (:ndt_stat
   (&rest __ndt_stat)
   (if (keywordp (car __ndt_stat))
       (send* _ndt_stat __ndt_stat)
     (progn
       (if __ndt_stat (setq _ndt_stat (car __ndt_stat)))
       _ndt_stat)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/PoseStamped _ndt_pose
    (send _ndt_pose :serialization-length)
    ;; geometry_msgs/PoseStamped _ndt_localizer_pose
    (send _ndt_localizer_pose :serialization-length)
    ;; geometry_msgs/TwistStamped _ndt_twist
    (send _ndt_twist :serialization-length)
    ;; geometry_msgs/PoseStamped _RTK_pose
    (send _RTK_pose :serialization-length)
    ;; geometry_msgs/PoseStamped _RTK_localizer_pose
    (send _RTK_localizer_pose :serialization-length)
    ;; autoware_msgs/GnssStandardDeviation _RTK_standard_deviation
    (send _RTK_standard_deviation :serialization-length)
    ;; autoware_msgs/NDTStat _ndt_stat
    (send _ndt_stat :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/PoseStamped _ndt_pose
       (send _ndt_pose :serialize s)
     ;; geometry_msgs/PoseStamped _ndt_localizer_pose
       (send _ndt_localizer_pose :serialize s)
     ;; geometry_msgs/TwistStamped _ndt_twist
       (send _ndt_twist :serialize s)
     ;; geometry_msgs/PoseStamped _RTK_pose
       (send _RTK_pose :serialize s)
     ;; geometry_msgs/PoseStamped _RTK_localizer_pose
       (send _RTK_localizer_pose :serialize s)
     ;; autoware_msgs/GnssStandardDeviation _RTK_standard_deviation
       (send _RTK_standard_deviation :serialize s)
     ;; autoware_msgs/NDTStat _ndt_stat
       (send _ndt_stat :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/PoseStamped _ndt_pose
     (send _ndt_pose :deserialize buf ptr-) (incf ptr- (send _ndt_pose :serialization-length))
   ;; geometry_msgs/PoseStamped _ndt_localizer_pose
     (send _ndt_localizer_pose :deserialize buf ptr-) (incf ptr- (send _ndt_localizer_pose :serialization-length))
   ;; geometry_msgs/TwistStamped _ndt_twist
     (send _ndt_twist :deserialize buf ptr-) (incf ptr- (send _ndt_twist :serialization-length))
   ;; geometry_msgs/PoseStamped _RTK_pose
     (send _RTK_pose :deserialize buf ptr-) (incf ptr- (send _RTK_pose :serialization-length))
   ;; geometry_msgs/PoseStamped _RTK_localizer_pose
     (send _RTK_localizer_pose :deserialize buf ptr-) (incf ptr- (send _RTK_localizer_pose :serialization-length))
   ;; autoware_msgs/GnssStandardDeviation _RTK_standard_deviation
     (send _RTK_standard_deviation :deserialize buf ptr-) (incf ptr- (send _RTK_standard_deviation :serialization-length))
   ;; autoware_msgs/NDTStat _ndt_stat
     (send _ndt_stat :deserialize buf ptr-) (incf ptr- (send _ndt_stat :serialization-length))
   ;;
   self)
  )

(setf (get autoware_msgs::NdtPoseAndRTKPose :md5sum-) "04033cc2ccf6e18ada42ff3baad16dfb")
(setf (get autoware_msgs::NdtPoseAndRTKPose :datatype-) "autoware_msgs/NdtPoseAndRTKPose")
(setf (get autoware_msgs::NdtPoseAndRTKPose :definition-)
      "Header header
geometry_msgs/PoseStamped ndt_pose
geometry_msgs/PoseStamped ndt_localizer_pose
geometry_msgs/TwistStamped ndt_twist
geometry_msgs/PoseStamped RTK_pose
geometry_msgs/PoseStamped RTK_localizer_pose
autoware_msgs/GnssStandardDeviation RTK_standard_deviation
autoware_msgs/NDTStat ndt_stat

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistStamped
# A twist with reference coordinate frame and timestamp
Header header
Twist twist

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: autoware_msgs/GnssStandardDeviation
Header header
float64 lat_std
float64 lon_std
float64 alt_std

================================================================================
MSG: autoware_msgs/NDTStat
Header header
float32 exe_time
int32 iteration
float32 score
float32 velocity
float32 acceleration
int32 use_predict_pose

")



(provide :autoware_msgs/NdtPoseAndRTKPose "04033cc2ccf6e18ada42ff3baad16dfb")


