;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::Waypoint)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'Waypoint (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::WAYPOINT")
  (make-package "AUTOWARE_MSGS::WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude Waypoint.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass autoware_msgs::Waypoint
  :super ros::object
  :slots (_gid _lid _pose _twist _dtlane _change_flag _wpstate _lane_id _left_lane_id _right_lane_id _stop_line_id _cost _time_cost _direction _waypoint_param _signals ))

(defmethod autoware_msgs::Waypoint
  (:init
   (&key
    ((:gid __gid) 0)
    ((:lid __lid) 0)
    ((:pose __pose) (instance geometry_msgs::PoseStamped :init))
    ((:twist __twist) (instance geometry_msgs::TwistStamped :init))
    ((:dtlane __dtlane) (instance autoware_msgs::DTLane :init))
    ((:change_flag __change_flag) 0)
    ((:wpstate __wpstate) (instance autoware_msgs::WaypointState :init))
    ((:lane_id __lane_id) 0)
    ((:left_lane_id __left_lane_id) 0)
    ((:right_lane_id __right_lane_id) 0)
    ((:stop_line_id __stop_line_id) 0)
    ((:cost __cost) 0.0)
    ((:time_cost __time_cost) 0.0)
    ((:direction __direction) 0)
    ((:waypoint_param __waypoint_param) (instance autoware_msgs::WaypointParam :init))
    ((:signals __signals) (let (r) (dotimes (i 0) (push (instance autoware_msgs::ExtractedPosition :init) r)) r))
    )
   (send-super :init)
   (setq _gid (round __gid))
   (setq _lid (round __lid))
   (setq _pose __pose)
   (setq _twist __twist)
   (setq _dtlane __dtlane)
   (setq _change_flag (round __change_flag))
   (setq _wpstate __wpstate)
   (setq _lane_id (round __lane_id))
   (setq _left_lane_id (round __left_lane_id))
   (setq _right_lane_id (round __right_lane_id))
   (setq _stop_line_id (round __stop_line_id))
   (setq _cost (float __cost))
   (setq _time_cost (float __time_cost))
   (setq _direction (round __direction))
   (setq _waypoint_param __waypoint_param)
   (setq _signals __signals)
   self)
  (:gid
   (&optional __gid)
   (if __gid (setq _gid __gid)) _gid)
  (:lid
   (&optional __lid)
   (if __lid (setq _lid __lid)) _lid)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:dtlane
   (&rest __dtlane)
   (if (keywordp (car __dtlane))
       (send* _dtlane __dtlane)
     (progn
       (if __dtlane (setq _dtlane (car __dtlane)))
       _dtlane)))
  (:change_flag
   (&optional __change_flag)
   (if __change_flag (setq _change_flag __change_flag)) _change_flag)
  (:wpstate
   (&rest __wpstate)
   (if (keywordp (car __wpstate))
       (send* _wpstate __wpstate)
     (progn
       (if __wpstate (setq _wpstate (car __wpstate)))
       _wpstate)))
  (:lane_id
   (&optional __lane_id)
   (if __lane_id (setq _lane_id __lane_id)) _lane_id)
  (:left_lane_id
   (&optional __left_lane_id)
   (if __left_lane_id (setq _left_lane_id __left_lane_id)) _left_lane_id)
  (:right_lane_id
   (&optional __right_lane_id)
   (if __right_lane_id (setq _right_lane_id __right_lane_id)) _right_lane_id)
  (:stop_line_id
   (&optional __stop_line_id)
   (if __stop_line_id (setq _stop_line_id __stop_line_id)) _stop_line_id)
  (:cost
   (&optional __cost)
   (if __cost (setq _cost __cost)) _cost)
  (:time_cost
   (&optional __time_cost)
   (if __time_cost (setq _time_cost __time_cost)) _time_cost)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:waypoint_param
   (&rest __waypoint_param)
   (if (keywordp (car __waypoint_param))
       (send* _waypoint_param __waypoint_param)
     (progn
       (if __waypoint_param (setq _waypoint_param (car __waypoint_param)))
       _waypoint_param)))
  (:signals
   (&rest __signals)
   (if (keywordp (car __signals))
       (send* _signals __signals)
     (progn
       (if __signals (setq _signals (car __signals)))
       _signals)))
  (:serialization-length
   ()
   (+
    ;; int32 _gid
    4
    ;; int32 _lid
    4
    ;; geometry_msgs/PoseStamped _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/TwistStamped _twist
    (send _twist :serialization-length)
    ;; autoware_msgs/DTLane _dtlane
    (send _dtlane :serialization-length)
    ;; int32 _change_flag
    4
    ;; autoware_msgs/WaypointState _wpstate
    (send _wpstate :serialization-length)
    ;; uint32 _lane_id
    4
    ;; uint32 _left_lane_id
    4
    ;; uint32 _right_lane_id
    4
    ;; uint32 _stop_line_id
    4
    ;; float32 _cost
    4
    ;; float32 _time_cost
    4
    ;; uint32 _direction
    4
    ;; autoware_msgs/WaypointParam _waypoint_param
    (send _waypoint_param :serialization-length)
    ;; autoware_msgs/ExtractedPosition[] _signals
    (apply #'+ (send-all _signals :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _gid
       (write-long _gid s)
     ;; int32 _lid
       (write-long _lid s)
     ;; geometry_msgs/PoseStamped _pose
       (send _pose :serialize s)
     ;; geometry_msgs/TwistStamped _twist
       (send _twist :serialize s)
     ;; autoware_msgs/DTLane _dtlane
       (send _dtlane :serialize s)
     ;; int32 _change_flag
       (write-long _change_flag s)
     ;; autoware_msgs/WaypointState _wpstate
       (send _wpstate :serialize s)
     ;; uint32 _lane_id
       (write-long _lane_id s)
     ;; uint32 _left_lane_id
       (write-long _left_lane_id s)
     ;; uint32 _right_lane_id
       (write-long _right_lane_id s)
     ;; uint32 _stop_line_id
       (write-long _stop_line_id s)
     ;; float32 _cost
       (sys::poke _cost (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _time_cost
       (sys::poke _time_cost (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint32 _direction
       (write-long _direction s)
     ;; autoware_msgs/WaypointParam _waypoint_param
       (send _waypoint_param :serialize s)
     ;; autoware_msgs/ExtractedPosition[] _signals
     (write-long (length _signals) s)
     (dolist (elem _signals)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _gid
     (setq _gid (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lid
     (setq _lid (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/PoseStamped _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/TwistStamped _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; autoware_msgs/DTLane _dtlane
     (send _dtlane :deserialize buf ptr-) (incf ptr- (send _dtlane :serialization-length))
   ;; int32 _change_flag
     (setq _change_flag (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; autoware_msgs/WaypointState _wpstate
     (send _wpstate :deserialize buf ptr-) (incf ptr- (send _wpstate :serialization-length))
   ;; uint32 _lane_id
     (setq _lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _left_lane_id
     (setq _left_lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _right_lane_id
     (setq _right_lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _stop_line_id
     (setq _stop_line_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _cost
     (setq _cost (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _time_cost
     (setq _time_cost (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint32 _direction
     (setq _direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; autoware_msgs/WaypointParam _waypoint_param
     (send _waypoint_param :deserialize buf ptr-) (incf ptr- (send _waypoint_param :serialization-length))
   ;; autoware_msgs/ExtractedPosition[] _signals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _signals (let (r) (dotimes (i n) (push (instance autoware_msgs::ExtractedPosition :init) r)) r))
     (dolist (elem- _signals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get autoware_msgs::Waypoint :md5sum-) "341d2d62ef3b96657a4679c92dc89f5e")
(setf (get autoware_msgs::Waypoint :datatype-) "autoware_msgs/Waypoint")
(setf (get autoware_msgs::Waypoint :definition-)
      "# global id
int32 gid 
# local id
int32 lid
geometry_msgs/PoseStamped pose
geometry_msgs/TwistStamped twist
DTLane dtlane
int32 change_flag
WaypointState wpstate

uint32 lane_id
uint32 left_lane_id
uint32 right_lane_id
uint32 stop_line_id
float32 cost
float32 time_cost

# Lane Direction
# FORWARD				= 0
# FORWARD_LEFT	 		= 1
# FORWARD_RIGHT			= 2
# BACKWARD				= 3 
# BACKWARD_LEFT			= 4
# BACKWARD_RIGHT		= 5
# STANDSTILL	 		= 6
uint32 direction

WaypointParam waypoint_param

ExtractedPosition[] signals

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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
MSG: autoware_msgs/DTLane
float64 dist
float64 dir
float64 apara
float64 r
float64 slope
float64 cant
float64 lw
float64 rw

================================================================================
MSG: autoware_msgs/WaypointState
int32 aid
uint8 NULLSTATE=0

# lanechange
uint8 lanechange_state

# bilinker
uint8 steering_state
uint8 STR_LEFT=1
uint8 STR_RIGHT=2
uint8 STR_STRAIGHT=3
uint8 STR_BACK=4

uint8 accel_state

uint8 stop_state
# 1 is stopline, 2 is stop which can only be released manually.
uint8 TYPE_STOPLINE=1
uint8 TYPE_STOP=2

uint8 event_state
uint8 TYPE_EVENT_NULL = 0
uint8 TYPE_EVENT_GOAL = 1
uint8 TYPE_EVENT_MIDDLE_GOAL = 2
uint8 TYPE_EVENT_POSITION_STOP = 3
uint8 TYPE_EVENT_BUS_STOP = 4
uint8 TYPE_EVENT_PARKING = 5

================================================================================
MSG: autoware_msgs/WaypointParam
Header header
uint32 id
float32 weight
int32 blinker
int32 feat_proj_x
int32 feat_proj_y
int32 velocity_KPPlus
int32 velocity_KPMinus
int32 velocity_punchPlus
int32 velocity_punchMinus
int32 velocity_windowPlus
int32 velocity_windowMinus
float64 drive_stroke
float64 brake_stroke
int16 mb_pedal
int32 pause
int32 pauseGroup
float32 vgf_leafsize
float32 vgf_measurement_range
ExtractedPosition[] signals
int32 curve_flag
int16 microbus_pedal
int16 microbus_angle
int8 automatic_door
int8 signal_stop_line
int8 temporary_stop_line
int8 fusion_select
float64 steer_correction
float32 lookahead_ratio
float32 minimum_lookahead_distance
float32 lookahead_ratio_magn
LiesseXZB70MParam liesse

================================================================================
MSG: autoware_msgs/ExtractedPosition
# This message defines the information required to describe a lamp (bulb)
# in a traffic signal, according to the information extracted from the ADAS Map
# and the extrinsic camera calibration

int32 signalId  # Traffic Signal Lamp ID
int32 u         # Lamp ROI x in image coords
int32 v         # Lamp ROI y in image coords
int32 radius    # Lamp Radius
float64 x       # X position in map coordinates
float64 y       # Y position in map coordinates
float64 z       # Z position in map coordinates
float64 hang    # Azimuth \"Horizontal Angle\"
int8 type       # Lamp Type (red, yellow, green, ...)
int32 linkId    # Closest LinkID (lane) in VectorMap
int32 plId      # PoleID to which this Lamp belongs to

================================================================================
MSG: autoware_msgs/LiesseXZB70MParam
Header header
int8 SHIFT_P = 0
int8 SHIFT_R = 1
int8 SHIFT_N = 2
int8 SHIFT_D = 3
int8 SHIFT_4 = 4
int8 SHIFT_L = 5
int8 shift

")



(provide :autoware_msgs/Waypoint "341d2d62ef3b96657a4679c92dc89f5e")


