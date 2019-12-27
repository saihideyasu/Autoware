// Auto-generated. Do not edit!

// (in-package autoware_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ExtractedPosition = require('./ExtractedPosition.js');
let LiesseXZB70MParam = require('./LiesseXZB70MParam.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WaypointParam {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.weight = null;
      this.blinker = null;
      this.feat_proj_x = null;
      this.feat_proj_y = null;
      this.velocity_KPPlus = null;
      this.velocity_KPMinus = null;
      this.velocity_punchPlus = null;
      this.velocity_punchMinus = null;
      this.velocity_windowPlus = null;
      this.velocity_windowMinus = null;
      this.drive_stroke = null;
      this.brake_stroke = null;
      this.mb_pedal = null;
      this.pause = null;
      this.pauseGroup = null;
      this.vgf_leafsize = null;
      this.vgf_measurement_range = null;
      this.signals = null;
      this.curve_flag = null;
      this.microbus_pedal = null;
      this.microbus_angle = null;
      this.automatic_door = null;
      this.signal_stop_line = null;
      this.temporary_stop_line = null;
      this.fusion_select = null;
      this.steer_correction = null;
      this.lookahead_ratio = null;
      this.minimum_lookahead_distance = null;
      this.lookahead_ratio_magn = null;
      this.liesse = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
      if (initObj.hasOwnProperty('blinker')) {
        this.blinker = initObj.blinker
      }
      else {
        this.blinker = 0;
      }
      if (initObj.hasOwnProperty('feat_proj_x')) {
        this.feat_proj_x = initObj.feat_proj_x
      }
      else {
        this.feat_proj_x = 0;
      }
      if (initObj.hasOwnProperty('feat_proj_y')) {
        this.feat_proj_y = initObj.feat_proj_y
      }
      else {
        this.feat_proj_y = 0;
      }
      if (initObj.hasOwnProperty('velocity_KPPlus')) {
        this.velocity_KPPlus = initObj.velocity_KPPlus
      }
      else {
        this.velocity_KPPlus = 0;
      }
      if (initObj.hasOwnProperty('velocity_KPMinus')) {
        this.velocity_KPMinus = initObj.velocity_KPMinus
      }
      else {
        this.velocity_KPMinus = 0;
      }
      if (initObj.hasOwnProperty('velocity_punchPlus')) {
        this.velocity_punchPlus = initObj.velocity_punchPlus
      }
      else {
        this.velocity_punchPlus = 0;
      }
      if (initObj.hasOwnProperty('velocity_punchMinus')) {
        this.velocity_punchMinus = initObj.velocity_punchMinus
      }
      else {
        this.velocity_punchMinus = 0;
      }
      if (initObj.hasOwnProperty('velocity_windowPlus')) {
        this.velocity_windowPlus = initObj.velocity_windowPlus
      }
      else {
        this.velocity_windowPlus = 0;
      }
      if (initObj.hasOwnProperty('velocity_windowMinus')) {
        this.velocity_windowMinus = initObj.velocity_windowMinus
      }
      else {
        this.velocity_windowMinus = 0;
      }
      if (initObj.hasOwnProperty('drive_stroke')) {
        this.drive_stroke = initObj.drive_stroke
      }
      else {
        this.drive_stroke = 0.0;
      }
      if (initObj.hasOwnProperty('brake_stroke')) {
        this.brake_stroke = initObj.brake_stroke
      }
      else {
        this.brake_stroke = 0.0;
      }
      if (initObj.hasOwnProperty('mb_pedal')) {
        this.mb_pedal = initObj.mb_pedal
      }
      else {
        this.mb_pedal = 0;
      }
      if (initObj.hasOwnProperty('pause')) {
        this.pause = initObj.pause
      }
      else {
        this.pause = 0;
      }
      if (initObj.hasOwnProperty('pauseGroup')) {
        this.pauseGroup = initObj.pauseGroup
      }
      else {
        this.pauseGroup = 0;
      }
      if (initObj.hasOwnProperty('vgf_leafsize')) {
        this.vgf_leafsize = initObj.vgf_leafsize
      }
      else {
        this.vgf_leafsize = 0.0;
      }
      if (initObj.hasOwnProperty('vgf_measurement_range')) {
        this.vgf_measurement_range = initObj.vgf_measurement_range
      }
      else {
        this.vgf_measurement_range = 0.0;
      }
      if (initObj.hasOwnProperty('signals')) {
        this.signals = initObj.signals
      }
      else {
        this.signals = [];
      }
      if (initObj.hasOwnProperty('curve_flag')) {
        this.curve_flag = initObj.curve_flag
      }
      else {
        this.curve_flag = 0;
      }
      if (initObj.hasOwnProperty('microbus_pedal')) {
        this.microbus_pedal = initObj.microbus_pedal
      }
      else {
        this.microbus_pedal = 0;
      }
      if (initObj.hasOwnProperty('microbus_angle')) {
        this.microbus_angle = initObj.microbus_angle
      }
      else {
        this.microbus_angle = 0;
      }
      if (initObj.hasOwnProperty('automatic_door')) {
        this.automatic_door = initObj.automatic_door
      }
      else {
        this.automatic_door = 0;
      }
      if (initObj.hasOwnProperty('signal_stop_line')) {
        this.signal_stop_line = initObj.signal_stop_line
      }
      else {
        this.signal_stop_line = 0;
      }
      if (initObj.hasOwnProperty('temporary_stop_line')) {
        this.temporary_stop_line = initObj.temporary_stop_line
      }
      else {
        this.temporary_stop_line = 0;
      }
      if (initObj.hasOwnProperty('fusion_select')) {
        this.fusion_select = initObj.fusion_select
      }
      else {
        this.fusion_select = 0;
      }
      if (initObj.hasOwnProperty('steer_correction')) {
        this.steer_correction = initObj.steer_correction
      }
      else {
        this.steer_correction = 0.0;
      }
      if (initObj.hasOwnProperty('lookahead_ratio')) {
        this.lookahead_ratio = initObj.lookahead_ratio
      }
      else {
        this.lookahead_ratio = 0.0;
      }
      if (initObj.hasOwnProperty('minimum_lookahead_distance')) {
        this.minimum_lookahead_distance = initObj.minimum_lookahead_distance
      }
      else {
        this.minimum_lookahead_distance = 0.0;
      }
      if (initObj.hasOwnProperty('lookahead_ratio_magn')) {
        this.lookahead_ratio_magn = initObj.lookahead_ratio_magn
      }
      else {
        this.lookahead_ratio_magn = 0.0;
      }
      if (initObj.hasOwnProperty('liesse')) {
        this.liesse = initObj.liesse
      }
      else {
        this.liesse = new LiesseXZB70MParam();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaypointParam
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float32(obj.weight, buffer, bufferOffset);
    // Serialize message field [blinker]
    bufferOffset = _serializer.int32(obj.blinker, buffer, bufferOffset);
    // Serialize message field [feat_proj_x]
    bufferOffset = _serializer.int32(obj.feat_proj_x, buffer, bufferOffset);
    // Serialize message field [feat_proj_y]
    bufferOffset = _serializer.int32(obj.feat_proj_y, buffer, bufferOffset);
    // Serialize message field [velocity_KPPlus]
    bufferOffset = _serializer.int32(obj.velocity_KPPlus, buffer, bufferOffset);
    // Serialize message field [velocity_KPMinus]
    bufferOffset = _serializer.int32(obj.velocity_KPMinus, buffer, bufferOffset);
    // Serialize message field [velocity_punchPlus]
    bufferOffset = _serializer.int32(obj.velocity_punchPlus, buffer, bufferOffset);
    // Serialize message field [velocity_punchMinus]
    bufferOffset = _serializer.int32(obj.velocity_punchMinus, buffer, bufferOffset);
    // Serialize message field [velocity_windowPlus]
    bufferOffset = _serializer.int32(obj.velocity_windowPlus, buffer, bufferOffset);
    // Serialize message field [velocity_windowMinus]
    bufferOffset = _serializer.int32(obj.velocity_windowMinus, buffer, bufferOffset);
    // Serialize message field [drive_stroke]
    bufferOffset = _serializer.float64(obj.drive_stroke, buffer, bufferOffset);
    // Serialize message field [brake_stroke]
    bufferOffset = _serializer.float64(obj.brake_stroke, buffer, bufferOffset);
    // Serialize message field [mb_pedal]
    bufferOffset = _serializer.int16(obj.mb_pedal, buffer, bufferOffset);
    // Serialize message field [pause]
    bufferOffset = _serializer.int32(obj.pause, buffer, bufferOffset);
    // Serialize message field [pauseGroup]
    bufferOffset = _serializer.int32(obj.pauseGroup, buffer, bufferOffset);
    // Serialize message field [vgf_leafsize]
    bufferOffset = _serializer.float32(obj.vgf_leafsize, buffer, bufferOffset);
    // Serialize message field [vgf_measurement_range]
    bufferOffset = _serializer.float32(obj.vgf_measurement_range, buffer, bufferOffset);
    // Serialize message field [signals]
    // Serialize the length for message field [signals]
    bufferOffset = _serializer.uint32(obj.signals.length, buffer, bufferOffset);
    obj.signals.forEach((val) => {
      bufferOffset = ExtractedPosition.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [curve_flag]
    bufferOffset = _serializer.int32(obj.curve_flag, buffer, bufferOffset);
    // Serialize message field [microbus_pedal]
    bufferOffset = _serializer.int16(obj.microbus_pedal, buffer, bufferOffset);
    // Serialize message field [microbus_angle]
    bufferOffset = _serializer.int16(obj.microbus_angle, buffer, bufferOffset);
    // Serialize message field [automatic_door]
    bufferOffset = _serializer.int8(obj.automatic_door, buffer, bufferOffset);
    // Serialize message field [signal_stop_line]
    bufferOffset = _serializer.int8(obj.signal_stop_line, buffer, bufferOffset);
    // Serialize message field [temporary_stop_line]
    bufferOffset = _serializer.int8(obj.temporary_stop_line, buffer, bufferOffset);
    // Serialize message field [fusion_select]
    bufferOffset = _serializer.int8(obj.fusion_select, buffer, bufferOffset);
    // Serialize message field [steer_correction]
    bufferOffset = _serializer.float64(obj.steer_correction, buffer, bufferOffset);
    // Serialize message field [lookahead_ratio]
    bufferOffset = _serializer.float32(obj.lookahead_ratio, buffer, bufferOffset);
    // Serialize message field [minimum_lookahead_distance]
    bufferOffset = _serializer.float32(obj.minimum_lookahead_distance, buffer, bufferOffset);
    // Serialize message field [lookahead_ratio_magn]
    bufferOffset = _serializer.float32(obj.lookahead_ratio_magn, buffer, bufferOffset);
    // Serialize message field [liesse]
    bufferOffset = LiesseXZB70MParam.serialize(obj.liesse, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaypointParam
    let len;
    let data = new WaypointParam(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [blinker]
    data.blinker = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [feat_proj_x]
    data.feat_proj_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [feat_proj_y]
    data.feat_proj_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_KPPlus]
    data.velocity_KPPlus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_KPMinus]
    data.velocity_KPMinus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_punchPlus]
    data.velocity_punchPlus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_punchMinus]
    data.velocity_punchMinus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_windowPlus]
    data.velocity_windowPlus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [velocity_windowMinus]
    data.velocity_windowMinus = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [drive_stroke]
    data.drive_stroke = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake_stroke]
    data.brake_stroke = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [mb_pedal]
    data.mb_pedal = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pause]
    data.pause = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pauseGroup]
    data.pauseGroup = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vgf_leafsize]
    data.vgf_leafsize = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vgf_measurement_range]
    data.vgf_measurement_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [signals]
    // Deserialize array length for message field [signals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.signals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.signals[i] = ExtractedPosition.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [curve_flag]
    data.curve_flag = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [microbus_pedal]
    data.microbus_pedal = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [microbus_angle]
    data.microbus_angle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [automatic_door]
    data.automatic_door = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [signal_stop_line]
    data.signal_stop_line = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [temporary_stop_line]
    data.temporary_stop_line = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fusion_select]
    data.fusion_select = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [steer_correction]
    data.steer_correction = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lookahead_ratio]
    data.lookahead_ratio = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [minimum_lookahead_distance]
    data.minimum_lookahead_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lookahead_ratio_magn]
    data.lookahead_ratio_magn = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [liesse]
    data.liesse = LiesseXZB70MParam.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 57 * object.signals.length;
    length += LiesseXZB70MParam.getMessageSize(object.liesse);
    return length + 114;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/WaypointParam';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3147c8953e95938db478b50912f9ec54';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new WaypointParam(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    if (msg.blinker !== undefined) {
      resolved.blinker = msg.blinker;
    }
    else {
      resolved.blinker = 0
    }

    if (msg.feat_proj_x !== undefined) {
      resolved.feat_proj_x = msg.feat_proj_x;
    }
    else {
      resolved.feat_proj_x = 0
    }

    if (msg.feat_proj_y !== undefined) {
      resolved.feat_proj_y = msg.feat_proj_y;
    }
    else {
      resolved.feat_proj_y = 0
    }

    if (msg.velocity_KPPlus !== undefined) {
      resolved.velocity_KPPlus = msg.velocity_KPPlus;
    }
    else {
      resolved.velocity_KPPlus = 0
    }

    if (msg.velocity_KPMinus !== undefined) {
      resolved.velocity_KPMinus = msg.velocity_KPMinus;
    }
    else {
      resolved.velocity_KPMinus = 0
    }

    if (msg.velocity_punchPlus !== undefined) {
      resolved.velocity_punchPlus = msg.velocity_punchPlus;
    }
    else {
      resolved.velocity_punchPlus = 0
    }

    if (msg.velocity_punchMinus !== undefined) {
      resolved.velocity_punchMinus = msg.velocity_punchMinus;
    }
    else {
      resolved.velocity_punchMinus = 0
    }

    if (msg.velocity_windowPlus !== undefined) {
      resolved.velocity_windowPlus = msg.velocity_windowPlus;
    }
    else {
      resolved.velocity_windowPlus = 0
    }

    if (msg.velocity_windowMinus !== undefined) {
      resolved.velocity_windowMinus = msg.velocity_windowMinus;
    }
    else {
      resolved.velocity_windowMinus = 0
    }

    if (msg.drive_stroke !== undefined) {
      resolved.drive_stroke = msg.drive_stroke;
    }
    else {
      resolved.drive_stroke = 0.0
    }

    if (msg.brake_stroke !== undefined) {
      resolved.brake_stroke = msg.brake_stroke;
    }
    else {
      resolved.brake_stroke = 0.0
    }

    if (msg.mb_pedal !== undefined) {
      resolved.mb_pedal = msg.mb_pedal;
    }
    else {
      resolved.mb_pedal = 0
    }

    if (msg.pause !== undefined) {
      resolved.pause = msg.pause;
    }
    else {
      resolved.pause = 0
    }

    if (msg.pauseGroup !== undefined) {
      resolved.pauseGroup = msg.pauseGroup;
    }
    else {
      resolved.pauseGroup = 0
    }

    if (msg.vgf_leafsize !== undefined) {
      resolved.vgf_leafsize = msg.vgf_leafsize;
    }
    else {
      resolved.vgf_leafsize = 0.0
    }

    if (msg.vgf_measurement_range !== undefined) {
      resolved.vgf_measurement_range = msg.vgf_measurement_range;
    }
    else {
      resolved.vgf_measurement_range = 0.0
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

    if (msg.curve_flag !== undefined) {
      resolved.curve_flag = msg.curve_flag;
    }
    else {
      resolved.curve_flag = 0
    }

    if (msg.microbus_pedal !== undefined) {
      resolved.microbus_pedal = msg.microbus_pedal;
    }
    else {
      resolved.microbus_pedal = 0
    }

    if (msg.microbus_angle !== undefined) {
      resolved.microbus_angle = msg.microbus_angle;
    }
    else {
      resolved.microbus_angle = 0
    }

    if (msg.automatic_door !== undefined) {
      resolved.automatic_door = msg.automatic_door;
    }
    else {
      resolved.automatic_door = 0
    }

    if (msg.signal_stop_line !== undefined) {
      resolved.signal_stop_line = msg.signal_stop_line;
    }
    else {
      resolved.signal_stop_line = 0
    }

    if (msg.temporary_stop_line !== undefined) {
      resolved.temporary_stop_line = msg.temporary_stop_line;
    }
    else {
      resolved.temporary_stop_line = 0
    }

    if (msg.fusion_select !== undefined) {
      resolved.fusion_select = msg.fusion_select;
    }
    else {
      resolved.fusion_select = 0
    }

    if (msg.steer_correction !== undefined) {
      resolved.steer_correction = msg.steer_correction;
    }
    else {
      resolved.steer_correction = 0.0
    }

    if (msg.lookahead_ratio !== undefined) {
      resolved.lookahead_ratio = msg.lookahead_ratio;
    }
    else {
      resolved.lookahead_ratio = 0.0
    }

    if (msg.minimum_lookahead_distance !== undefined) {
      resolved.minimum_lookahead_distance = msg.minimum_lookahead_distance;
    }
    else {
      resolved.minimum_lookahead_distance = 0.0
    }

    if (msg.lookahead_ratio_magn !== undefined) {
      resolved.lookahead_ratio_magn = msg.lookahead_ratio_magn;
    }
    else {
      resolved.lookahead_ratio_magn = 0.0
    }

    if (msg.liesse !== undefined) {
      resolved.liesse = LiesseXZB70MParam.Resolve(msg.liesse)
    }
    else {
      resolved.liesse = new LiesseXZB70MParam()
    }

    return resolved;
    }
};

module.exports = WaypointParam;
