// Auto-generated. Do not edit!

// (in-package autoware_can_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MicroBusCan501 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.emergency = null;
      this.steer_auto = null;
      this.drive_auto = null;
      this.drive_mode = null;
      this.velocity = null;
      this.steering_angle = null;
      this.pedal = null;
      this.emergency_stop = null;
      this.engine_start = null;
      this.ignition = null;
      this.wiper = null;
      this.light_high = null;
      this.light_low = null;
      this.light_small = null;
      this.horn = null;
      this.hazard = null;
      this.blinker_right = null;
      this.blinker_left = null;
      this.shift = null;
      this.side_brake = null;
      this.automatic_door = null;
      this.read_counter = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('emergency')) {
        this.emergency = initObj.emergency
      }
      else {
        this.emergency = false;
      }
      if (initObj.hasOwnProperty('steer_auto')) {
        this.steer_auto = initObj.steer_auto
      }
      else {
        this.steer_auto = 0;
      }
      if (initObj.hasOwnProperty('drive_auto')) {
        this.drive_auto = initObj.drive_auto
      }
      else {
        this.drive_auto = 0;
      }
      if (initObj.hasOwnProperty('drive_mode')) {
        this.drive_mode = initObj.drive_mode
      }
      else {
        this.drive_mode = 0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0;
      }
      if (initObj.hasOwnProperty('steering_angle')) {
        this.steering_angle = initObj.steering_angle
      }
      else {
        this.steering_angle = 0;
      }
      if (initObj.hasOwnProperty('pedal')) {
        this.pedal = initObj.pedal
      }
      else {
        this.pedal = 0;
      }
      if (initObj.hasOwnProperty('emergency_stop')) {
        this.emergency_stop = initObj.emergency_stop
      }
      else {
        this.emergency_stop = 0;
      }
      if (initObj.hasOwnProperty('engine_start')) {
        this.engine_start = initObj.engine_start
      }
      else {
        this.engine_start = false;
      }
      if (initObj.hasOwnProperty('ignition')) {
        this.ignition = initObj.ignition
      }
      else {
        this.ignition = false;
      }
      if (initObj.hasOwnProperty('wiper')) {
        this.wiper = initObj.wiper
      }
      else {
        this.wiper = false;
      }
      if (initObj.hasOwnProperty('light_high')) {
        this.light_high = initObj.light_high
      }
      else {
        this.light_high = false;
      }
      if (initObj.hasOwnProperty('light_low')) {
        this.light_low = initObj.light_low
      }
      else {
        this.light_low = false;
      }
      if (initObj.hasOwnProperty('light_small')) {
        this.light_small = initObj.light_small
      }
      else {
        this.light_small = false;
      }
      if (initObj.hasOwnProperty('horn')) {
        this.horn = initObj.horn
      }
      else {
        this.horn = false;
      }
      if (initObj.hasOwnProperty('hazard')) {
        this.hazard = initObj.hazard
      }
      else {
        this.hazard = false;
      }
      if (initObj.hasOwnProperty('blinker_right')) {
        this.blinker_right = initObj.blinker_right
      }
      else {
        this.blinker_right = false;
      }
      if (initObj.hasOwnProperty('blinker_left')) {
        this.blinker_left = initObj.blinker_left
      }
      else {
        this.blinker_left = false;
      }
      if (initObj.hasOwnProperty('shift')) {
        this.shift = initObj.shift
      }
      else {
        this.shift = 0;
      }
      if (initObj.hasOwnProperty('side_brake')) {
        this.side_brake = initObj.side_brake
      }
      else {
        this.side_brake = 0;
      }
      if (initObj.hasOwnProperty('automatic_door')) {
        this.automatic_door = initObj.automatic_door
      }
      else {
        this.automatic_door = 0;
      }
      if (initObj.hasOwnProperty('read_counter')) {
        this.read_counter = initObj.read_counter
      }
      else {
        this.read_counter = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MicroBusCan501
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [emergency]
    bufferOffset = _serializer.bool(obj.emergency, buffer, bufferOffset);
    // Serialize message field [steer_auto]
    bufferOffset = _serializer.uint8(obj.steer_auto, buffer, bufferOffset);
    // Serialize message field [drive_auto]
    bufferOffset = _serializer.uint8(obj.drive_auto, buffer, bufferOffset);
    // Serialize message field [drive_mode]
    bufferOffset = _serializer.int8(obj.drive_mode, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.int16(obj.velocity, buffer, bufferOffset);
    // Serialize message field [steering_angle]
    bufferOffset = _serializer.int16(obj.steering_angle, buffer, bufferOffset);
    // Serialize message field [pedal]
    bufferOffset = _serializer.int16(obj.pedal, buffer, bufferOffset);
    // Serialize message field [emergency_stop]
    bufferOffset = _serializer.uint8(obj.emergency_stop, buffer, bufferOffset);
    // Serialize message field [engine_start]
    bufferOffset = _serializer.bool(obj.engine_start, buffer, bufferOffset);
    // Serialize message field [ignition]
    bufferOffset = _serializer.bool(obj.ignition, buffer, bufferOffset);
    // Serialize message field [wiper]
    bufferOffset = _serializer.bool(obj.wiper, buffer, bufferOffset);
    // Serialize message field [light_high]
    bufferOffset = _serializer.bool(obj.light_high, buffer, bufferOffset);
    // Serialize message field [light_low]
    bufferOffset = _serializer.bool(obj.light_low, buffer, bufferOffset);
    // Serialize message field [light_small]
    bufferOffset = _serializer.bool(obj.light_small, buffer, bufferOffset);
    // Serialize message field [horn]
    bufferOffset = _serializer.bool(obj.horn, buffer, bufferOffset);
    // Serialize message field [hazard]
    bufferOffset = _serializer.bool(obj.hazard, buffer, bufferOffset);
    // Serialize message field [blinker_right]
    bufferOffset = _serializer.bool(obj.blinker_right, buffer, bufferOffset);
    // Serialize message field [blinker_left]
    bufferOffset = _serializer.bool(obj.blinker_left, buffer, bufferOffset);
    // Serialize message field [shift]
    bufferOffset = _serializer.uint8(obj.shift, buffer, bufferOffset);
    // Serialize message field [side_brake]
    bufferOffset = _serializer.uint8(obj.side_brake, buffer, bufferOffset);
    // Serialize message field [automatic_door]
    bufferOffset = _serializer.uint8(obj.automatic_door, buffer, bufferOffset);
    // Serialize message field [read_counter]
    bufferOffset = _serializer.uint32(obj.read_counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MicroBusCan501
    let len;
    let data = new MicroBusCan501(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [emergency]
    data.emergency = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [steer_auto]
    data.steer_auto = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [drive_auto]
    data.drive_auto = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [drive_mode]
    data.drive_mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [steering_angle]
    data.steering_angle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pedal]
    data.pedal = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [emergency_stop]
    data.emergency_stop = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [engine_start]
    data.engine_start = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ignition]
    data.ignition = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [wiper]
    data.wiper = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [light_high]
    data.light_high = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [light_low]
    data.light_low = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [light_small]
    data.light_small = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [horn]
    data.horn = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [hazard]
    data.hazard = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blinker_right]
    data.blinker_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [blinker_left]
    data.blinker_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [shift]
    data.shift = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [side_brake]
    data.side_brake = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [automatic_door]
    data.automatic_door = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [read_counter]
    data.read_counter = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_can_msgs/MicroBusCan501';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '539da6c17a8bf01b808295f7fea2b8ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 DRIVE_MODE_NONE = 0
    int8 DRIVE_MODE_STROKE = 10
    int8 DRIVE_MODE_VELOCITY = 11
    
    int8 SHIFT_MANUAL = 0
    int8 SHIFT_NOW_CHANGE = 15
    int8 SHIFT_P = 8
    int8 SHIFT_R = 9
    int8 SHIFT_N = 10
    int8 SHIFT_D = 11
    int8 SHIFT_4 = 12
    int8 SHIFT_L = 13
    
    uint8 STEER_V0 = 0
    uint8 STEER_AUTO = 10
    uint8 STEER_NOT_V0 = 4
    uint8 STEER_NOT_JOY_CENTER = 1
    uint8 STEER_NOT_BOARD_RES = 8
    
    uint8 DRIVE_V0 = 0
    uint8 DRIVE_AUTO = 10
    uint8 DRIVE_NOT_V0 = 4
    uint8 DRIVE_NOT_JOY_CENTER = 1
    uint8 DRIVE_NOT_BOARD_RES = 8
    
    Header header
    bool emergency
    uint8 steer_auto
    uint8 drive_auto
    int8 drive_mode
    int16 velocity
    int16 steering_angle
    int16 pedal
    uint8 emergency_stop
    bool engine_start
    bool ignition
    bool wiper
    bool light_high
    bool light_low
    bool light_small
    bool horn
    bool hazard
    bool blinker_right
    bool blinker_left
    uint8 shift
    uint8 side_brake
    uint8 automatic_door
    uint32 read_counter
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MicroBusCan501(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.emergency !== undefined) {
      resolved.emergency = msg.emergency;
    }
    else {
      resolved.emergency = false
    }

    if (msg.steer_auto !== undefined) {
      resolved.steer_auto = msg.steer_auto;
    }
    else {
      resolved.steer_auto = 0
    }

    if (msg.drive_auto !== undefined) {
      resolved.drive_auto = msg.drive_auto;
    }
    else {
      resolved.drive_auto = 0
    }

    if (msg.drive_mode !== undefined) {
      resolved.drive_mode = msg.drive_mode;
    }
    else {
      resolved.drive_mode = 0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0
    }

    if (msg.steering_angle !== undefined) {
      resolved.steering_angle = msg.steering_angle;
    }
    else {
      resolved.steering_angle = 0
    }

    if (msg.pedal !== undefined) {
      resolved.pedal = msg.pedal;
    }
    else {
      resolved.pedal = 0
    }

    if (msg.emergency_stop !== undefined) {
      resolved.emergency_stop = msg.emergency_stop;
    }
    else {
      resolved.emergency_stop = 0
    }

    if (msg.engine_start !== undefined) {
      resolved.engine_start = msg.engine_start;
    }
    else {
      resolved.engine_start = false
    }

    if (msg.ignition !== undefined) {
      resolved.ignition = msg.ignition;
    }
    else {
      resolved.ignition = false
    }

    if (msg.wiper !== undefined) {
      resolved.wiper = msg.wiper;
    }
    else {
      resolved.wiper = false
    }

    if (msg.light_high !== undefined) {
      resolved.light_high = msg.light_high;
    }
    else {
      resolved.light_high = false
    }

    if (msg.light_low !== undefined) {
      resolved.light_low = msg.light_low;
    }
    else {
      resolved.light_low = false
    }

    if (msg.light_small !== undefined) {
      resolved.light_small = msg.light_small;
    }
    else {
      resolved.light_small = false
    }

    if (msg.horn !== undefined) {
      resolved.horn = msg.horn;
    }
    else {
      resolved.horn = false
    }

    if (msg.hazard !== undefined) {
      resolved.hazard = msg.hazard;
    }
    else {
      resolved.hazard = false
    }

    if (msg.blinker_right !== undefined) {
      resolved.blinker_right = msg.blinker_right;
    }
    else {
      resolved.blinker_right = false
    }

    if (msg.blinker_left !== undefined) {
      resolved.blinker_left = msg.blinker_left;
    }
    else {
      resolved.blinker_left = false
    }

    if (msg.shift !== undefined) {
      resolved.shift = msg.shift;
    }
    else {
      resolved.shift = 0
    }

    if (msg.side_brake !== undefined) {
      resolved.side_brake = msg.side_brake;
    }
    else {
      resolved.side_brake = 0
    }

    if (msg.automatic_door !== undefined) {
      resolved.automatic_door = msg.automatic_door;
    }
    else {
      resolved.automatic_door = 0
    }

    if (msg.read_counter !== undefined) {
      resolved.read_counter = msg.read_counter;
    }
    else {
      resolved.read_counter = 0
    }

    return resolved;
    }
};

// Constants for message
MicroBusCan501.Constants = {
  DRIVE_MODE_NONE: 0,
  DRIVE_MODE_STROKE: 10,
  DRIVE_MODE_VELOCITY: 11,
  SHIFT_MANUAL: 0,
  SHIFT_NOW_CHANGE: 15,
  SHIFT_P: 8,
  SHIFT_R: 9,
  SHIFT_N: 10,
  SHIFT_D: 11,
  SHIFT_4: 12,
  SHIFT_L: 13,
  STEER_V0: 0,
  STEER_AUTO: 10,
  STEER_NOT_V0: 4,
  STEER_NOT_JOY_CENTER: 1,
  STEER_NOT_BOARD_RES: 8,
  DRIVE_V0: 0,
  DRIVE_AUTO: 10,
  DRIVE_NOT_V0: 4,
  DRIVE_NOT_JOY_CENTER: 1,
  DRIVE_NOT_BOARD_RES: 8,
}

module.exports = MicroBusCan501;
