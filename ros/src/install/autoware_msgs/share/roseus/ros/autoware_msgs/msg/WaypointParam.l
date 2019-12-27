;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::WaypointParam)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'WaypointParam (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::WAYPOINTPARAM")
  (make-package "AUTOWARE_MSGS::WAYPOINTPARAM"))

(in-package "ROS")
;;//! \htmlinclude WaypointParam.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::WaypointParam
  :super ros::object
  :slots (_header _id _weight _blinker _feat_proj_x _feat_proj_y _velocity_KPPlus _velocity_KPMinus _velocity_punchPlus _velocity_punchMinus _velocity_windowPlus _velocity_windowMinus _drive_stroke _brake_stroke _mb_pedal _pause _pauseGroup _vgf_leafsize _vgf_measurement_range _signals _curve_flag _microbus_pedal _microbus_angle _automatic_door _signal_stop_line _temporary_stop_line _fusion_select _steer_correction _lookahead_ratio _minimum_lookahead_distance _lookahead_ratio_magn _liesse ))

(defmethod autoware_msgs::WaypointParam
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:weight __weight) 0.0)
    ((:blinker __blinker) 0)
    ((:feat_proj_x __feat_proj_x) 0)
    ((:feat_proj_y __feat_proj_y) 0)
    ((:velocity_KPPlus __velocity_KPPlus) 0)
    ((:velocity_KPMinus __velocity_KPMinus) 0)
    ((:velocity_punchPlus __velocity_punchPlus) 0)
    ((:velocity_punchMinus __velocity_punchMinus) 0)
    ((:velocity_windowPlus __velocity_windowPlus) 0)
    ((:velocity_windowMinus __velocity_windowMinus) 0)
    ((:drive_stroke __drive_stroke) 0.0)
    ((:brake_stroke __brake_stroke) 0.0)
    ((:mb_pedal __mb_pedal) 0)
    ((:pause __pause) 0)
    ((:pauseGroup __pauseGroup) 0)
    ((:vgf_leafsize __vgf_leafsize) 0.0)
    ((:vgf_measurement_range __vgf_measurement_range) 0.0)
    ((:signals __signals) (let (r) (dotimes (i 0) (push (instance autoware_msgs::ExtractedPosition :init) r)) r))
    ((:curve_flag __curve_flag) 0)
    ((:microbus_pedal __microbus_pedal) 0)
    ((:microbus_angle __microbus_angle) 0)
    ((:automatic_door __automatic_door) 0)
    ((:signal_stop_line __signal_stop_line) 0)
    ((:temporary_stop_line __temporary_stop_line) 0)
    ((:fusion_select __fusion_select) 0)
    ((:steer_correction __steer_correction) 0.0)
    ((:lookahead_ratio __lookahead_ratio) 0.0)
    ((:minimum_lookahead_distance __minimum_lookahead_distance) 0.0)
    ((:lookahead_ratio_magn __lookahead_ratio_magn) 0.0)
    ((:liesse __liesse) (instance autoware_msgs::LiesseXZB70MParam :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _weight (float __weight))
   (setq _blinker (round __blinker))
   (setq _feat_proj_x (round __feat_proj_x))
   (setq _feat_proj_y (round __feat_proj_y))
   (setq _velocity_KPPlus (round __velocity_KPPlus))
   (setq _velocity_KPMinus (round __velocity_KPMinus))
   (setq _velocity_punchPlus (round __velocity_punchPlus))
   (setq _velocity_punchMinus (round __velocity_punchMinus))
   (setq _velocity_windowPlus (round __velocity_windowPlus))
   (setq _velocity_windowMinus (round __velocity_windowMinus))
   (setq _drive_stroke (float __drive_stroke))
   (setq _brake_stroke (float __brake_stroke))
   (setq _mb_pedal (round __mb_pedal))
   (setq _pause (round __pause))
   (setq _pauseGroup (round __pauseGroup))
   (setq _vgf_leafsize (float __vgf_leafsize))
   (setq _vgf_measurement_range (float __vgf_measurement_range))
   (setq _signals __signals)
   (setq _curve_flag (round __curve_flag))
   (setq _microbus_pedal (round __microbus_pedal))
   (setq _microbus_angle (round __microbus_angle))
   (setq _automatic_door (round __automatic_door))
   (setq _signal_stop_line (round __signal_stop_line))
   (setq _temporary_stop_line (round __temporary_stop_line))
   (setq _fusion_select (round __fusion_select))
   (setq _steer_correction (float __steer_correction))
   (setq _lookahead_ratio (float __lookahead_ratio))
   (setq _minimum_lookahead_distance (float __minimum_lookahead_distance))
   (setq _lookahead_ratio_magn (float __lookahead_ratio_magn))
   (setq _liesse __liesse)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:blinker
   (&optional __blinker)
   (if __blinker (setq _blinker __blinker)) _blinker)
  (:feat_proj_x
   (&optional __feat_proj_x)
   (if __feat_proj_x (setq _feat_proj_x __feat_proj_x)) _feat_proj_x)
  (:feat_proj_y
   (&optional __feat_proj_y)
   (if __feat_proj_y (setq _feat_proj_y __feat_proj_y)) _feat_proj_y)
  (:velocity_KPPlus
   (&optional __velocity_KPPlus)
   (if __velocity_KPPlus (setq _velocity_KPPlus __velocity_KPPlus)) _velocity_KPPlus)
  (:velocity_KPMinus
   (&optional __velocity_KPMinus)
   (if __velocity_KPMinus (setq _velocity_KPMinus __velocity_KPMinus)) _velocity_KPMinus)
  (:velocity_punchPlus
   (&optional __velocity_punchPlus)
   (if __velocity_punchPlus (setq _velocity_punchPlus __velocity_punchPlus)) _velocity_punchPlus)
  (:velocity_punchMinus
   (&optional __velocity_punchMinus)
   (if __velocity_punchMinus (setq _velocity_punchMinus __velocity_punchMinus)) _velocity_punchMinus)
  (:velocity_windowPlus
   (&optional __velocity_windowPlus)
   (if __velocity_windowPlus (setq _velocity_windowPlus __velocity_windowPlus)) _velocity_windowPlus)
  (:velocity_windowMinus
   (&optional __velocity_windowMinus)
   (if __velocity_windowMinus (setq _velocity_windowMinus __velocity_windowMinus)) _velocity_windowMinus)
  (:drive_stroke
   (&optional __drive_stroke)
   (if __drive_stroke (setq _drive_stroke __drive_stroke)) _drive_stroke)
  (:brake_stroke
   (&optional __brake_stroke)
   (if __brake_stroke (setq _brake_stroke __brake_stroke)) _brake_stroke)
  (:mb_pedal
   (&optional __mb_pedal)
   (if __mb_pedal (setq _mb_pedal __mb_pedal)) _mb_pedal)
  (:pause
   (&optional __pause)
   (if __pause (setq _pause __pause)) _pause)
  (:pauseGroup
   (&optional __pauseGroup)
   (if __pauseGroup (setq _pauseGroup __pauseGroup)) _pauseGroup)
  (:vgf_leafsize
   (&optional __vgf_leafsize)
   (if __vgf_leafsize (setq _vgf_leafsize __vgf_leafsize)) _vgf_leafsize)
  (:vgf_measurement_range
   (&optional __vgf_measurement_range)
   (if __vgf_measurement_range (setq _vgf_measurement_range __vgf_measurement_range)) _vgf_measurement_range)
  (:signals
   (&rest __signals)
   (if (keywordp (car __signals))
       (send* _signals __signals)
     (progn
       (if __signals (setq _signals (car __signals)))
       _signals)))
  (:curve_flag
   (&optional __curve_flag)
   (if __curve_flag (setq _curve_flag __curve_flag)) _curve_flag)
  (:microbus_pedal
   (&optional __microbus_pedal)
   (if __microbus_pedal (setq _microbus_pedal __microbus_pedal)) _microbus_pedal)
  (:microbus_angle
   (&optional __microbus_angle)
   (if __microbus_angle (setq _microbus_angle __microbus_angle)) _microbus_angle)
  (:automatic_door
   (&optional __automatic_door)
   (if __automatic_door (setq _automatic_door __automatic_door)) _automatic_door)
  (:signal_stop_line
   (&optional __signal_stop_line)
   (if __signal_stop_line (setq _signal_stop_line __signal_stop_line)) _signal_stop_line)
  (:temporary_stop_line
   (&optional __temporary_stop_line)
   (if __temporary_stop_line (setq _temporary_stop_line __temporary_stop_line)) _temporary_stop_line)
  (:fusion_select
   (&optional __fusion_select)
   (if __fusion_select (setq _fusion_select __fusion_select)) _fusion_select)
  (:steer_correction
   (&optional __steer_correction)
   (if __steer_correction (setq _steer_correction __steer_correction)) _steer_correction)
  (:lookahead_ratio
   (&optional __lookahead_ratio)
   (if __lookahead_ratio (setq _lookahead_ratio __lookahead_ratio)) _lookahead_ratio)
  (:minimum_lookahead_distance
   (&optional __minimum_lookahead_distance)
   (if __minimum_lookahead_distance (setq _minimum_lookahead_distance __minimum_lookahead_distance)) _minimum_lookahead_distance)
  (:lookahead_ratio_magn
   (&optional __lookahead_ratio_magn)
   (if __lookahead_ratio_magn (setq _lookahead_ratio_magn __lookahead_ratio_magn)) _lookahead_ratio_magn)
  (:liesse
   (&rest __liesse)
   (if (keywordp (car __liesse))
       (send* _liesse __liesse)
     (progn
       (if __liesse (setq _liesse (car __liesse)))
       _liesse)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _id
    4
    ;; float32 _weight
    4
    ;; int32 _blinker
    4
    ;; int32 _feat_proj_x
    4
    ;; int32 _feat_proj_y
    4
    ;; int32 _velocity_KPPlus
    4
    ;; int32 _velocity_KPMinus
    4
    ;; int32 _velocity_punchPlus
    4
    ;; int32 _velocity_punchMinus
    4
    ;; int32 _velocity_windowPlus
    4
    ;; int32 _velocity_windowMinus
    4
    ;; float64 _drive_stroke
    8
    ;; float64 _brake_stroke
    8
    ;; int16 _mb_pedal
    2
    ;; int32 _pause
    4
    ;; int32 _pauseGroup
    4
    ;; float32 _vgf_leafsize
    4
    ;; float32 _vgf_measurement_range
    4
    ;; autoware_msgs/ExtractedPosition[] _signals
    (apply #'+ (send-all _signals :serialization-length)) 4
    ;; int32 _curve_flag
    4
    ;; int16 _microbus_pedal
    2
    ;; int16 _microbus_angle
    2
    ;; int8 _automatic_door
    1
    ;; int8 _signal_stop_line
    1
    ;; int8 _temporary_stop_line
    1
    ;; int8 _fusion_select
    1
    ;; float64 _steer_correction
    8
    ;; float32 _lookahead_ratio
    4
    ;; float32 _minimum_lookahead_distance
    4
    ;; float32 _lookahead_ratio_magn
    4
    ;; autoware_msgs/LiesseXZB70MParam _liesse
    (send _liesse :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _id
       (write-long _id s)
     ;; float32 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _blinker
       (write-long _blinker s)
     ;; int32 _feat_proj_x
       (write-long _feat_proj_x s)
     ;; int32 _feat_proj_y
       (write-long _feat_proj_y s)
     ;; int32 _velocity_KPPlus
       (write-long _velocity_KPPlus s)
     ;; int32 _velocity_KPMinus
       (write-long _velocity_KPMinus s)
     ;; int32 _velocity_punchPlus
       (write-long _velocity_punchPlus s)
     ;; int32 _velocity_punchMinus
       (write-long _velocity_punchMinus s)
     ;; int32 _velocity_windowPlus
       (write-long _velocity_windowPlus s)
     ;; int32 _velocity_windowMinus
       (write-long _velocity_windowMinus s)
     ;; float64 _drive_stroke
       (sys::poke _drive_stroke (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake_stroke
       (sys::poke _brake_stroke (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int16 _mb_pedal
       (write-word _mb_pedal s)
     ;; int32 _pause
       (write-long _pause s)
     ;; int32 _pauseGroup
       (write-long _pauseGroup s)
     ;; float32 _vgf_leafsize
       (sys::poke _vgf_leafsize (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vgf_measurement_range
       (sys::poke _vgf_measurement_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; autoware_msgs/ExtractedPosition[] _signals
     (write-long (length _signals) s)
     (dolist (elem _signals)
       (send elem :serialize s)
       )
     ;; int32 _curve_flag
       (write-long _curve_flag s)
     ;; int16 _microbus_pedal
       (write-word _microbus_pedal s)
     ;; int16 _microbus_angle
       (write-word _microbus_angle s)
     ;; int8 _automatic_door
       (write-byte _automatic_door s)
     ;; int8 _signal_stop_line
       (write-byte _signal_stop_line s)
     ;; int8 _temporary_stop_line
       (write-byte _temporary_stop_line s)
     ;; int8 _fusion_select
       (write-byte _fusion_select s)
     ;; float64 _steer_correction
       (sys::poke _steer_correction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _lookahead_ratio
       (sys::poke _lookahead_ratio (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _minimum_lookahead_distance
       (sys::poke _minimum_lookahead_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lookahead_ratio_magn
       (sys::poke _lookahead_ratio_magn (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; autoware_msgs/LiesseXZB70MParam _liesse
       (send _liesse :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _weight
     (setq _weight (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _blinker
     (setq _blinker (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _feat_proj_x
     (setq _feat_proj_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _feat_proj_y
     (setq _feat_proj_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_KPPlus
     (setq _velocity_KPPlus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_KPMinus
     (setq _velocity_KPMinus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_punchPlus
     (setq _velocity_punchPlus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_punchMinus
     (setq _velocity_punchMinus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_windowPlus
     (setq _velocity_windowPlus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _velocity_windowMinus
     (setq _velocity_windowMinus (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _drive_stroke
     (setq _drive_stroke (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake_stroke
     (setq _brake_stroke (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int16 _mb_pedal
     (setq _mb_pedal (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _pause
     (setq _pause (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pauseGroup
     (setq _pauseGroup (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _vgf_leafsize
     (setq _vgf_leafsize (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vgf_measurement_range
     (setq _vgf_measurement_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; autoware_msgs/ExtractedPosition[] _signals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _signals (let (r) (dotimes (i n) (push (instance autoware_msgs::ExtractedPosition :init) r)) r))
     (dolist (elem- _signals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int32 _curve_flag
     (setq _curve_flag (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int16 _microbus_pedal
     (setq _microbus_pedal (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _microbus_angle
     (setq _microbus_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int8 _automatic_door
     (setq _automatic_door (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _automatic_door 127) (setq _automatic_door (- _automatic_door 256)))
   ;; int8 _signal_stop_line
     (setq _signal_stop_line (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _signal_stop_line 127) (setq _signal_stop_line (- _signal_stop_line 256)))
   ;; int8 _temporary_stop_line
     (setq _temporary_stop_line (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _temporary_stop_line 127) (setq _temporary_stop_line (- _temporary_stop_line 256)))
   ;; int8 _fusion_select
     (setq _fusion_select (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fusion_select 127) (setq _fusion_select (- _fusion_select 256)))
   ;; float64 _steer_correction
     (setq _steer_correction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _lookahead_ratio
     (setq _lookahead_ratio (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _minimum_lookahead_distance
     (setq _minimum_lookahead_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lookahead_ratio_magn
     (setq _lookahead_ratio_magn (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; autoware_msgs/LiesseXZB70MParam _liesse
     (send _liesse :deserialize buf ptr-) (incf ptr- (send _liesse :serialization-length))
   ;;
   self)
  )

(setf (get autoware_msgs::WaypointParam :md5sum-) "3147c8953e95938db478b50912f9ec54")
(setf (get autoware_msgs::WaypointParam :datatype-) "autoware_msgs/WaypointParam")
(setf (get autoware_msgs::WaypointParam :definition-)
      "Header header
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



(provide :autoware_msgs/WaypointParam "3147c8953e95938db478b50912f9ec54")


