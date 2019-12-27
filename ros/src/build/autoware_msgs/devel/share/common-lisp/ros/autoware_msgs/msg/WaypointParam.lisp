; Auto-generated. Do not edit!


(cl:in-package autoware_msgs-msg)


;//! \htmlinclude WaypointParam.msg.html

(cl:defclass <WaypointParam> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (weight
    :reader weight
    :initarg :weight
    :type cl:float
    :initform 0.0)
   (blinker
    :reader blinker
    :initarg :blinker
    :type cl:integer
    :initform 0)
   (feat_proj_x
    :reader feat_proj_x
    :initarg :feat_proj_x
    :type cl:integer
    :initform 0)
   (feat_proj_y
    :reader feat_proj_y
    :initarg :feat_proj_y
    :type cl:integer
    :initform 0)
   (velocity_KPPlus
    :reader velocity_KPPlus
    :initarg :velocity_KPPlus
    :type cl:integer
    :initform 0)
   (velocity_KPMinus
    :reader velocity_KPMinus
    :initarg :velocity_KPMinus
    :type cl:integer
    :initform 0)
   (velocity_punchPlus
    :reader velocity_punchPlus
    :initarg :velocity_punchPlus
    :type cl:integer
    :initform 0)
   (velocity_punchMinus
    :reader velocity_punchMinus
    :initarg :velocity_punchMinus
    :type cl:integer
    :initform 0)
   (velocity_windowPlus
    :reader velocity_windowPlus
    :initarg :velocity_windowPlus
    :type cl:integer
    :initform 0)
   (velocity_windowMinus
    :reader velocity_windowMinus
    :initarg :velocity_windowMinus
    :type cl:integer
    :initform 0)
   (drive_stroke
    :reader drive_stroke
    :initarg :drive_stroke
    :type cl:float
    :initform 0.0)
   (brake_stroke
    :reader brake_stroke
    :initarg :brake_stroke
    :type cl:float
    :initform 0.0)
   (mb_pedal
    :reader mb_pedal
    :initarg :mb_pedal
    :type cl:fixnum
    :initform 0)
   (pause
    :reader pause
    :initarg :pause
    :type cl:integer
    :initform 0)
   (pauseGroup
    :reader pauseGroup
    :initarg :pauseGroup
    :type cl:integer
    :initform 0)
   (vgf_leafsize
    :reader vgf_leafsize
    :initarg :vgf_leafsize
    :type cl:float
    :initform 0.0)
   (vgf_measurement_range
    :reader vgf_measurement_range
    :initarg :vgf_measurement_range
    :type cl:float
    :initform 0.0)
   (signals
    :reader signals
    :initarg :signals
    :type (cl:vector autoware_msgs-msg:ExtractedPosition)
   :initform (cl:make-array 0 :element-type 'autoware_msgs-msg:ExtractedPosition :initial-element (cl:make-instance 'autoware_msgs-msg:ExtractedPosition)))
   (curve_flag
    :reader curve_flag
    :initarg :curve_flag
    :type cl:integer
    :initform 0)
   (microbus_pedal
    :reader microbus_pedal
    :initarg :microbus_pedal
    :type cl:fixnum
    :initform 0)
   (microbus_angle
    :reader microbus_angle
    :initarg :microbus_angle
    :type cl:fixnum
    :initform 0)
   (automatic_door
    :reader automatic_door
    :initarg :automatic_door
    :type cl:fixnum
    :initform 0)
   (signal_stop_line
    :reader signal_stop_line
    :initarg :signal_stop_line
    :type cl:fixnum
    :initform 0)
   (temporary_stop_line
    :reader temporary_stop_line
    :initarg :temporary_stop_line
    :type cl:fixnum
    :initform 0)
   (fusion_select
    :reader fusion_select
    :initarg :fusion_select
    :type cl:fixnum
    :initform 0)
   (steer_correction
    :reader steer_correction
    :initarg :steer_correction
    :type cl:float
    :initform 0.0)
   (lookahead_ratio
    :reader lookahead_ratio
    :initarg :lookahead_ratio
    :type cl:float
    :initform 0.0)
   (minimum_lookahead_distance
    :reader minimum_lookahead_distance
    :initarg :minimum_lookahead_distance
    :type cl:float
    :initform 0.0)
   (lookahead_ratio_magn
    :reader lookahead_ratio_magn
    :initarg :lookahead_ratio_magn
    :type cl:float
    :initform 0.0)
   (liesse
    :reader liesse
    :initarg :liesse
    :type autoware_msgs-msg:LiesseXZB70MParam
    :initform (cl:make-instance 'autoware_msgs-msg:LiesseXZB70MParam)))
)

(cl:defclass WaypointParam (<WaypointParam>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WaypointParam>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WaypointParam)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name autoware_msgs-msg:<WaypointParam> is deprecated: use autoware_msgs-msg:WaypointParam instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:header-val is deprecated.  Use autoware_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:id-val is deprecated.  Use autoware_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:weight-val is deprecated.  Use autoware_msgs-msg:weight instead.")
  (weight m))

(cl:ensure-generic-function 'blinker-val :lambda-list '(m))
(cl:defmethod blinker-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:blinker-val is deprecated.  Use autoware_msgs-msg:blinker instead.")
  (blinker m))

(cl:ensure-generic-function 'feat_proj_x-val :lambda-list '(m))
(cl:defmethod feat_proj_x-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:feat_proj_x-val is deprecated.  Use autoware_msgs-msg:feat_proj_x instead.")
  (feat_proj_x m))

(cl:ensure-generic-function 'feat_proj_y-val :lambda-list '(m))
(cl:defmethod feat_proj_y-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:feat_proj_y-val is deprecated.  Use autoware_msgs-msg:feat_proj_y instead.")
  (feat_proj_y m))

(cl:ensure-generic-function 'velocity_KPPlus-val :lambda-list '(m))
(cl:defmethod velocity_KPPlus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_KPPlus-val is deprecated.  Use autoware_msgs-msg:velocity_KPPlus instead.")
  (velocity_KPPlus m))

(cl:ensure-generic-function 'velocity_KPMinus-val :lambda-list '(m))
(cl:defmethod velocity_KPMinus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_KPMinus-val is deprecated.  Use autoware_msgs-msg:velocity_KPMinus instead.")
  (velocity_KPMinus m))

(cl:ensure-generic-function 'velocity_punchPlus-val :lambda-list '(m))
(cl:defmethod velocity_punchPlus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_punchPlus-val is deprecated.  Use autoware_msgs-msg:velocity_punchPlus instead.")
  (velocity_punchPlus m))

(cl:ensure-generic-function 'velocity_punchMinus-val :lambda-list '(m))
(cl:defmethod velocity_punchMinus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_punchMinus-val is deprecated.  Use autoware_msgs-msg:velocity_punchMinus instead.")
  (velocity_punchMinus m))

(cl:ensure-generic-function 'velocity_windowPlus-val :lambda-list '(m))
(cl:defmethod velocity_windowPlus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_windowPlus-val is deprecated.  Use autoware_msgs-msg:velocity_windowPlus instead.")
  (velocity_windowPlus m))

(cl:ensure-generic-function 'velocity_windowMinus-val :lambda-list '(m))
(cl:defmethod velocity_windowMinus-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:velocity_windowMinus-val is deprecated.  Use autoware_msgs-msg:velocity_windowMinus instead.")
  (velocity_windowMinus m))

(cl:ensure-generic-function 'drive_stroke-val :lambda-list '(m))
(cl:defmethod drive_stroke-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:drive_stroke-val is deprecated.  Use autoware_msgs-msg:drive_stroke instead.")
  (drive_stroke m))

(cl:ensure-generic-function 'brake_stroke-val :lambda-list '(m))
(cl:defmethod brake_stroke-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:brake_stroke-val is deprecated.  Use autoware_msgs-msg:brake_stroke instead.")
  (brake_stroke m))

(cl:ensure-generic-function 'mb_pedal-val :lambda-list '(m))
(cl:defmethod mb_pedal-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:mb_pedal-val is deprecated.  Use autoware_msgs-msg:mb_pedal instead.")
  (mb_pedal m))

(cl:ensure-generic-function 'pause-val :lambda-list '(m))
(cl:defmethod pause-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:pause-val is deprecated.  Use autoware_msgs-msg:pause instead.")
  (pause m))

(cl:ensure-generic-function 'pauseGroup-val :lambda-list '(m))
(cl:defmethod pauseGroup-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:pauseGroup-val is deprecated.  Use autoware_msgs-msg:pauseGroup instead.")
  (pauseGroup m))

(cl:ensure-generic-function 'vgf_leafsize-val :lambda-list '(m))
(cl:defmethod vgf_leafsize-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:vgf_leafsize-val is deprecated.  Use autoware_msgs-msg:vgf_leafsize instead.")
  (vgf_leafsize m))

(cl:ensure-generic-function 'vgf_measurement_range-val :lambda-list '(m))
(cl:defmethod vgf_measurement_range-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:vgf_measurement_range-val is deprecated.  Use autoware_msgs-msg:vgf_measurement_range instead.")
  (vgf_measurement_range m))

(cl:ensure-generic-function 'signals-val :lambda-list '(m))
(cl:defmethod signals-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:signals-val is deprecated.  Use autoware_msgs-msg:signals instead.")
  (signals m))

(cl:ensure-generic-function 'curve_flag-val :lambda-list '(m))
(cl:defmethod curve_flag-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:curve_flag-val is deprecated.  Use autoware_msgs-msg:curve_flag instead.")
  (curve_flag m))

(cl:ensure-generic-function 'microbus_pedal-val :lambda-list '(m))
(cl:defmethod microbus_pedal-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:microbus_pedal-val is deprecated.  Use autoware_msgs-msg:microbus_pedal instead.")
  (microbus_pedal m))

(cl:ensure-generic-function 'microbus_angle-val :lambda-list '(m))
(cl:defmethod microbus_angle-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:microbus_angle-val is deprecated.  Use autoware_msgs-msg:microbus_angle instead.")
  (microbus_angle m))

(cl:ensure-generic-function 'automatic_door-val :lambda-list '(m))
(cl:defmethod automatic_door-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:automatic_door-val is deprecated.  Use autoware_msgs-msg:automatic_door instead.")
  (automatic_door m))

(cl:ensure-generic-function 'signal_stop_line-val :lambda-list '(m))
(cl:defmethod signal_stop_line-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:signal_stop_line-val is deprecated.  Use autoware_msgs-msg:signal_stop_line instead.")
  (signal_stop_line m))

(cl:ensure-generic-function 'temporary_stop_line-val :lambda-list '(m))
(cl:defmethod temporary_stop_line-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:temporary_stop_line-val is deprecated.  Use autoware_msgs-msg:temporary_stop_line instead.")
  (temporary_stop_line m))

(cl:ensure-generic-function 'fusion_select-val :lambda-list '(m))
(cl:defmethod fusion_select-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:fusion_select-val is deprecated.  Use autoware_msgs-msg:fusion_select instead.")
  (fusion_select m))

(cl:ensure-generic-function 'steer_correction-val :lambda-list '(m))
(cl:defmethod steer_correction-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:steer_correction-val is deprecated.  Use autoware_msgs-msg:steer_correction instead.")
  (steer_correction m))

(cl:ensure-generic-function 'lookahead_ratio-val :lambda-list '(m))
(cl:defmethod lookahead_ratio-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:lookahead_ratio-val is deprecated.  Use autoware_msgs-msg:lookahead_ratio instead.")
  (lookahead_ratio m))

(cl:ensure-generic-function 'minimum_lookahead_distance-val :lambda-list '(m))
(cl:defmethod minimum_lookahead_distance-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:minimum_lookahead_distance-val is deprecated.  Use autoware_msgs-msg:minimum_lookahead_distance instead.")
  (minimum_lookahead_distance m))

(cl:ensure-generic-function 'lookahead_ratio_magn-val :lambda-list '(m))
(cl:defmethod lookahead_ratio_magn-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:lookahead_ratio_magn-val is deprecated.  Use autoware_msgs-msg:lookahead_ratio_magn instead.")
  (lookahead_ratio_magn m))

(cl:ensure-generic-function 'liesse-val :lambda-list '(m))
(cl:defmethod liesse-val ((m <WaypointParam>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader autoware_msgs-msg:liesse-val is deprecated.  Use autoware_msgs-msg:liesse instead.")
  (liesse m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WaypointParam>) ostream)
  "Serializes a message object of type '<WaypointParam>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'weight))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'blinker)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'feat_proj_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'feat_proj_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_KPPlus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_KPMinus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_punchPlus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_punchMinus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_windowPlus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity_windowMinus)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'drive_stroke))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'brake_stroke))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'mb_pedal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pause)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pauseGroup)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vgf_leafsize))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vgf_measurement_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'signals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'signals))
  (cl:let* ((signed (cl:slot-value msg 'curve_flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'microbus_pedal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'microbus_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'automatic_door)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'signal_stop_line)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'temporary_stop_line)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fusion_select)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'steer_correction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lookahead_ratio))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'minimum_lookahead_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'lookahead_ratio_magn))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'liesse) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WaypointParam>) istream)
  "Deserializes a message object of type '<WaypointParam>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'weight) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'blinker) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feat_proj_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feat_proj_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_KPPlus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_KPMinus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_punchPlus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_punchMinus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_windowPlus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity_windowMinus) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'drive_stroke) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'brake_stroke) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mb_pedal) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pause) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pauseGroup) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vgf_leafsize) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vgf_measurement_range) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'signals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'signals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'autoware_msgs-msg:ExtractedPosition))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'curve_flag) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'microbus_pedal) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'microbus_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'automatic_door) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'signal_stop_line) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'temporary_stop_line) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fusion_select) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steer_correction) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lookahead_ratio) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minimum_lookahead_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lookahead_ratio_magn) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'liesse) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WaypointParam>)))
  "Returns string type for a message object of type '<WaypointParam>"
  "autoware_msgs/WaypointParam")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WaypointParam)))
  "Returns string type for a message object of type 'WaypointParam"
  "autoware_msgs/WaypointParam")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WaypointParam>)))
  "Returns md5sum for a message object of type '<WaypointParam>"
  "3147c8953e95938db478b50912f9ec54")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WaypointParam)))
  "Returns md5sum for a message object of type 'WaypointParam"
  "3147c8953e95938db478b50912f9ec54")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WaypointParam>)))
  "Returns full string definition for message of type '<WaypointParam>"
  (cl:format cl:nil "Header header~%uint32 id~%float32 weight~%int32 blinker~%int32 feat_proj_x~%int32 feat_proj_y~%int32 velocity_KPPlus~%int32 velocity_KPMinus~%int32 velocity_punchPlus~%int32 velocity_punchMinus~%int32 velocity_windowPlus~%int32 velocity_windowMinus~%float64 drive_stroke~%float64 brake_stroke~%int16 mb_pedal~%int32 pause~%int32 pauseGroup~%float32 vgf_leafsize~%float32 vgf_measurement_range~%ExtractedPosition[] signals~%int32 curve_flag~%int16 microbus_pedal~%int16 microbus_angle~%int8 automatic_door~%int8 signal_stop_line~%int8 temporary_stop_line~%int8 fusion_select~%float64 steer_correction~%float32 lookahead_ratio~%float32 minimum_lookahead_distance~%float32 lookahead_ratio_magn~%LiesseXZB70MParam liesse~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: autoware_msgs/ExtractedPosition~%# This message defines the information required to describe a lamp (bulb)~%# in a traffic signal, according to the information extracted from the ADAS Map~%# and the extrinsic camera calibration~%~%int32 signalId  # Traffic Signal Lamp ID~%int32 u         # Lamp ROI x in image coords~%int32 v         # Lamp ROI y in image coords~%int32 radius    # Lamp Radius~%float64 x       # X position in map coordinates~%float64 y       # Y position in map coordinates~%float64 z       # Z position in map coordinates~%float64 hang    # Azimuth \"Horizontal Angle\"~%int8 type       # Lamp Type (red, yellow, green, ...)~%int32 linkId    # Closest LinkID (lane) in VectorMap~%int32 plId      # PoleID to which this Lamp belongs to~%~%================================================================================~%MSG: autoware_msgs/LiesseXZB70MParam~%Header header~%int8 SHIFT_P = 0~%int8 SHIFT_R = 1~%int8 SHIFT_N = 2~%int8 SHIFT_D = 3~%int8 SHIFT_4 = 4~%int8 SHIFT_L = 5~%int8 shift~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WaypointParam)))
  "Returns full string definition for message of type 'WaypointParam"
  (cl:format cl:nil "Header header~%uint32 id~%float32 weight~%int32 blinker~%int32 feat_proj_x~%int32 feat_proj_y~%int32 velocity_KPPlus~%int32 velocity_KPMinus~%int32 velocity_punchPlus~%int32 velocity_punchMinus~%int32 velocity_windowPlus~%int32 velocity_windowMinus~%float64 drive_stroke~%float64 brake_stroke~%int16 mb_pedal~%int32 pause~%int32 pauseGroup~%float32 vgf_leafsize~%float32 vgf_measurement_range~%ExtractedPosition[] signals~%int32 curve_flag~%int16 microbus_pedal~%int16 microbus_angle~%int8 automatic_door~%int8 signal_stop_line~%int8 temporary_stop_line~%int8 fusion_select~%float64 steer_correction~%float32 lookahead_ratio~%float32 minimum_lookahead_distance~%float32 lookahead_ratio_magn~%LiesseXZB70MParam liesse~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: autoware_msgs/ExtractedPosition~%# This message defines the information required to describe a lamp (bulb)~%# in a traffic signal, according to the information extracted from the ADAS Map~%# and the extrinsic camera calibration~%~%int32 signalId  # Traffic Signal Lamp ID~%int32 u         # Lamp ROI x in image coords~%int32 v         # Lamp ROI y in image coords~%int32 radius    # Lamp Radius~%float64 x       # X position in map coordinates~%float64 y       # Y position in map coordinates~%float64 z       # Z position in map coordinates~%float64 hang    # Azimuth \"Horizontal Angle\"~%int8 type       # Lamp Type (red, yellow, green, ...)~%int32 linkId    # Closest LinkID (lane) in VectorMap~%int32 plId      # PoleID to which this Lamp belongs to~%~%================================================================================~%MSG: autoware_msgs/LiesseXZB70MParam~%Header header~%int8 SHIFT_P = 0~%int8 SHIFT_R = 1~%int8 SHIFT_N = 2~%int8 SHIFT_D = 3~%int8 SHIFT_4 = 4~%int8 SHIFT_L = 5~%int8 shift~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WaypointParam>))
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
     8
     8
     2
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'signals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     2
     2
     1
     1
     1
     1
     8
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'liesse))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WaypointParam>))
  "Converts a ROS message object to a list"
  (cl:list 'WaypointParam
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':weight (weight msg))
    (cl:cons ':blinker (blinker msg))
    (cl:cons ':feat_proj_x (feat_proj_x msg))
    (cl:cons ':feat_proj_y (feat_proj_y msg))
    (cl:cons ':velocity_KPPlus (velocity_KPPlus msg))
    (cl:cons ':velocity_KPMinus (velocity_KPMinus msg))
    (cl:cons ':velocity_punchPlus (velocity_punchPlus msg))
    (cl:cons ':velocity_punchMinus (velocity_punchMinus msg))
    (cl:cons ':velocity_windowPlus (velocity_windowPlus msg))
    (cl:cons ':velocity_windowMinus (velocity_windowMinus msg))
    (cl:cons ':drive_stroke (drive_stroke msg))
    (cl:cons ':brake_stroke (brake_stroke msg))
    (cl:cons ':mb_pedal (mb_pedal msg))
    (cl:cons ':pause (pause msg))
    (cl:cons ':pauseGroup (pauseGroup msg))
    (cl:cons ':vgf_leafsize (vgf_leafsize msg))
    (cl:cons ':vgf_measurement_range (vgf_measurement_range msg))
    (cl:cons ':signals (signals msg))
    (cl:cons ':curve_flag (curve_flag msg))
    (cl:cons ':microbus_pedal (microbus_pedal msg))
    (cl:cons ':microbus_angle (microbus_angle msg))
    (cl:cons ':automatic_door (automatic_door msg))
    (cl:cons ':signal_stop_line (signal_stop_line msg))
    (cl:cons ':temporary_stop_line (temporary_stop_line msg))
    (cl:cons ':fusion_select (fusion_select msg))
    (cl:cons ':steer_correction (steer_correction msg))
    (cl:cons ':lookahead_ratio (lookahead_ratio msg))
    (cl:cons ':minimum_lookahead_distance (minimum_lookahead_distance msg))
    (cl:cons ':lookahead_ratio_magn (lookahead_ratio_magn msg))
    (cl:cons ':liesse (liesse msg))
))
