// Auto-generated. Do not edit!

// (in-package autoware_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DTLane = require('./DTLane.js');
let WaypointState = require('./WaypointState.js');
let WaypointParam = require('./WaypointParam.js');
let ExtractedPosition = require('./ExtractedPosition.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Waypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gid = null;
      this.lid = null;
      this.pose = null;
      this.twist = null;
      this.dtlane = null;
      this.change_flag = null;
      this.wpstate = null;
      this.lane_id = null;
      this.left_lane_id = null;
      this.right_lane_id = null;
      this.stop_line_id = null;
      this.cost = null;
      this.time_cost = null;
      this.direction = null;
      this.waypoint_param = null;
      this.signals = null;
    }
    else {
      if (initObj.hasOwnProperty('gid')) {
        this.gid = initObj.gid
      }
      else {
        this.gid = 0;
      }
      if (initObj.hasOwnProperty('lid')) {
        this.lid = initObj.lid
      }
      else {
        this.lid = 0;
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('twist')) {
        this.twist = initObj.twist
      }
      else {
        this.twist = new geometry_msgs.msg.TwistStamped();
      }
      if (initObj.hasOwnProperty('dtlane')) {
        this.dtlane = initObj.dtlane
      }
      else {
        this.dtlane = new DTLane();
      }
      if (initObj.hasOwnProperty('change_flag')) {
        this.change_flag = initObj.change_flag
      }
      else {
        this.change_flag = 0;
      }
      if (initObj.hasOwnProperty('wpstate')) {
        this.wpstate = initObj.wpstate
      }
      else {
        this.wpstate = new WaypointState();
      }
      if (initObj.hasOwnProperty('lane_id')) {
        this.lane_id = initObj.lane_id
      }
      else {
        this.lane_id = 0;
      }
      if (initObj.hasOwnProperty('left_lane_id')) {
        this.left_lane_id = initObj.left_lane_id
      }
      else {
        this.left_lane_id = 0;
      }
      if (initObj.hasOwnProperty('right_lane_id')) {
        this.right_lane_id = initObj.right_lane_id
      }
      else {
        this.right_lane_id = 0;
      }
      if (initObj.hasOwnProperty('stop_line_id')) {
        this.stop_line_id = initObj.stop_line_id
      }
      else {
        this.stop_line_id = 0;
      }
      if (initObj.hasOwnProperty('cost')) {
        this.cost = initObj.cost
      }
      else {
        this.cost = 0.0;
      }
      if (initObj.hasOwnProperty('time_cost')) {
        this.time_cost = initObj.time_cost
      }
      else {
        this.time_cost = 0.0;
      }
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = 0;
      }
      if (initObj.hasOwnProperty('waypoint_param')) {
        this.waypoint_param = initObj.waypoint_param
      }
      else {
        this.waypoint_param = new WaypointParam();
      }
      if (initObj.hasOwnProperty('signals')) {
        this.signals = initObj.signals
      }
      else {
        this.signals = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Waypoint
    // Serialize message field [gid]
    bufferOffset = _serializer.int32(obj.gid, buffer, bufferOffset);
    // Serialize message field [lid]
    bufferOffset = _serializer.int32(obj.lid, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [twist]
    bufferOffset = geometry_msgs.msg.TwistStamped.serialize(obj.twist, buffer, bufferOffset);
    // Serialize message field [dtlane]
    bufferOffset = DTLane.serialize(obj.dtlane, buffer, bufferOffset);
    // Serialize message field [change_flag]
    bufferOffset = _serializer.int32(obj.change_flag, buffer, bufferOffset);
    // Serialize message field [wpstate]
    bufferOffset = WaypointState.serialize(obj.wpstate, buffer, bufferOffset);
    // Serialize message field [lane_id]
    bufferOffset = _serializer.uint32(obj.lane_id, buffer, bufferOffset);
    // Serialize message field [left_lane_id]
    bufferOffset = _serializer.uint32(obj.left_lane_id, buffer, bufferOffset);
    // Serialize message field [right_lane_id]
    bufferOffset = _serializer.uint32(obj.right_lane_id, buffer, bufferOffset);
    // Serialize message field [stop_line_id]
    bufferOffset = _serializer.uint32(obj.stop_line_id, buffer, bufferOffset);
    // Serialize message field [cost]
    bufferOffset = _serializer.float32(obj.cost, buffer, bufferOffset);
    // Serialize message field [time_cost]
    bufferOffset = _serializer.float32(obj.time_cost, buffer, bufferOffset);
    // Serialize message field [direction]
    bufferOffset = _serializer.uint32(obj.direction, buffer, bufferOffset);
    // Serialize message field [waypoint_param]
    bufferOffset = WaypointParam.serialize(obj.waypoint_param, buffer, bufferOffset);
    // Serialize message field [signals]
    // Serialize the length for message field [signals]
    bufferOffset = _serializer.uint32(obj.signals.length, buffer, bufferOffset);
    obj.signals.forEach((val) => {
      bufferOffset = ExtractedPosition.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Waypoint
    let len;
    let data = new Waypoint(null);
    // Deserialize message field [gid]
    data.gid = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lid]
    data.lid = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [twist]
    data.twist = geometry_msgs.msg.TwistStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [dtlane]
    data.dtlane = DTLane.deserialize(buffer, bufferOffset);
    // Deserialize message field [change_flag]
    data.change_flag = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [wpstate]
    data.wpstate = WaypointState.deserialize(buffer, bufferOffset);
    // Deserialize message field [lane_id]
    data.lane_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [left_lane_id]
    data.left_lane_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [right_lane_id]
    data.right_lane_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [stop_line_id]
    data.stop_line_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [cost]
    data.cost = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [time_cost]
    data.time_cost = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [direction]
    data.direction = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [waypoint_param]
    data.waypoint_param = WaypointParam.deserialize(buffer, bufferOffset);
    // Deserialize message field [signals]
    // Deserialize array length for message field [signals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.signals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.signals[i] = ExtractedPosition.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.pose);
    length += geometry_msgs.msg.TwistStamped.getMessageSize(object.twist);
    length += WaypointParam.getMessageSize(object.waypoint_param);
    length += 57 * object.signals.length;
    return length + 117;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/Waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '341d2d62ef3b96657a4679c92dc89f5e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # global id
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
    float64 hang    # Azimuth "Horizontal Angle"
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Waypoint(null);
    if (msg.gid !== undefined) {
      resolved.gid = msg.gid;
    }
    else {
      resolved.gid = 0
    }

    if (msg.lid !== undefined) {
      resolved.lid = msg.lid;
    }
    else {
      resolved.lid = 0
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.PoseStamped.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.twist !== undefined) {
      resolved.twist = geometry_msgs.msg.TwistStamped.Resolve(msg.twist)
    }
    else {
      resolved.twist = new geometry_msgs.msg.TwistStamped()
    }

    if (msg.dtlane !== undefined) {
      resolved.dtlane = DTLane.Resolve(msg.dtlane)
    }
    else {
      resolved.dtlane = new DTLane()
    }

    if (msg.change_flag !== undefined) {
      resolved.change_flag = msg.change_flag;
    }
    else {
      resolved.change_flag = 0
    }

    if (msg.wpstate !== undefined) {
      resolved.wpstate = WaypointState.Resolve(msg.wpstate)
    }
    else {
      resolved.wpstate = new WaypointState()
    }

    if (msg.lane_id !== undefined) {
      resolved.lane_id = msg.lane_id;
    }
    else {
      resolved.lane_id = 0
    }

    if (msg.left_lane_id !== undefined) {
      resolved.left_lane_id = msg.left_lane_id;
    }
    else {
      resolved.left_lane_id = 0
    }

    if (msg.right_lane_id !== undefined) {
      resolved.right_lane_id = msg.right_lane_id;
    }
    else {
      resolved.right_lane_id = 0
    }

    if (msg.stop_line_id !== undefined) {
      resolved.stop_line_id = msg.stop_line_id;
    }
    else {
      resolved.stop_line_id = 0
    }

    if (msg.cost !== undefined) {
      resolved.cost = msg.cost;
    }
    else {
      resolved.cost = 0.0
    }

    if (msg.time_cost !== undefined) {
      resolved.time_cost = msg.time_cost;
    }
    else {
      resolved.time_cost = 0.0
    }

    if (msg.direction !== undefined) {
      resolved.direction = msg.direction;
    }
    else {
      resolved.direction = 0
    }

    if (msg.waypoint_param !== undefined) {
      resolved.waypoint_param = WaypointParam.Resolve(msg.waypoint_param)
    }
    else {
      resolved.waypoint_param = new WaypointParam()
    }

    if (msg.signals !== undefined) {
      resolved.signals = new Array(msg.signals.length);
      for (let i = 0; i < resolved.signals.length; ++i) {
        resolved.signals[i] = ExtractedPosition.Resolve(msg.signals[i]);
      }
    }
    else {
      resolved.signals = []
    }

    return resolved;
    }
};

module.exports = Waypoint;
