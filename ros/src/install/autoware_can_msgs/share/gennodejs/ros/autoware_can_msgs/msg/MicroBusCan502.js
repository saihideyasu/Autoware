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

class MicroBusCan502 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.cycle_time = null;
      this.angle_actual = null;
      this.angle_deg = null;
      this.velocity_actual = null;
      this.velocity_average = null;
      this.velocity_median = null;
      this.acceleration_actual = null;
      this.acceleration_average = null;
      this.acceleration_median = null;
      this.velocity_mps = null;
      this.clutch = null;
      this.read_counter = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('cycle_time')) {
        this.cycle_time = initObj.cycle_time
      }
      else {
        this.cycle_time = 0.0;
      }
      if (initObj.hasOwnProperty('angle_actual')) {
        this.angle_actual = initObj.angle_actual
      }
      else {
        this.angle_actual = 0;
      }
      if (initObj.hasOwnProperty('angle_deg')) {
        this.angle_deg = initObj.angle_deg
      }
      else {
        this.angle_deg = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_actual')) {
        this.velocity_actual = initObj.velocity_actual
      }
      else {
        this.velocity_actual = 0;
      }
      if (initObj.hasOwnProperty('velocity_average')) {
        this.velocity_average = initObj.velocity_average
      }
      else {
        this.velocity_average = 0;
      }
      if (initObj.hasOwnProperty('velocity_median')) {
        this.velocity_median = initObj.velocity_median
      }
      else {
        this.velocity_median = 0;
      }
      if (initObj.hasOwnProperty('acceleration_actual')) {
        this.acceleration_actual = initObj.acceleration_actual
      }
      else {
        this.acceleration_actual = 0;
      }
      if (initObj.hasOwnProperty('acceleration_average')) {
        this.acceleration_average = initObj.acceleration_average
      }
      else {
        this.acceleration_average = 0;
      }
      if (initObj.hasOwnProperty('acceleration_median')) {
        this.acceleration_median = initObj.acceleration_median
      }
      else {
        this.acceleration_median = 0;
      }
      if (initObj.hasOwnProperty('velocity_mps')) {
        this.velocity_mps = initObj.velocity_mps
      }
      else {
        this.velocity_mps = 0.0;
      }
      if (initObj.hasOwnProperty('clutch')) {
        this.clutch = initObj.clutch
      }
      else {
        this.clutch = false;
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
    // Serializes a message object of type MicroBusCan502
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [cycle_time]
    bufferOffset = _serializer.float64(obj.cycle_time, buffer, bufferOffset);
    // Serialize message field [angle_actual]
    bufferOffset = _serializer.int16(obj.angle_actual, buffer, bufferOffset);
    // Serialize message field [angle_deg]
    bufferOffset = _serializer.float64(obj.angle_deg, buffer, bufferOffset);
    // Serialize message field [velocity_actual]
    bufferOffset = _serializer.int16(obj.velocity_actual, buffer, bufferOffset);
    // Serialize message field [velocity_average]
    bufferOffset = _serializer.int16(obj.velocity_average, buffer, bufferOffset);
    // Serialize message field [velocity_median]
    bufferOffset = _serializer.int16(obj.velocity_median, buffer, bufferOffset);
    // Serialize message field [acceleration_actual]
    bufferOffset = _serializer.int16(obj.acceleration_actual, buffer, bufferOffset);
    // Serialize message field [acceleration_average]
    bufferOffset = _serializer.int16(obj.acceleration_average, buffer, bufferOffset);
    // Serialize message field [acceleration_median]
    bufferOffset = _serializer.int16(obj.acceleration_median, buffer, bufferOffset);
    // Serialize message field [velocity_mps]
    bufferOffset = _serializer.float64(obj.velocity_mps, buffer, bufferOffset);
    // Serialize message field [clutch]
    bufferOffset = _serializer.bool(obj.clutch, buffer, bufferOffset);
    // Serialize message field [read_counter]
    bufferOffset = _serializer.uint32(obj.read_counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MicroBusCan502
    let len;
    let data = new MicroBusCan502(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [cycle_time]
    data.cycle_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_actual]
    data.angle_actual = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [angle_deg]
    data.angle_deg = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_actual]
    data.velocity_actual = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [velocity_average]
    data.velocity_average = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [velocity_median]
    data.velocity_median = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acceleration_actual]
    data.acceleration_actual = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acceleration_average]
    data.acceleration_average = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [acceleration_median]
    data.acceleration_median = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [velocity_mps]
    data.velocity_mps = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [clutch]
    data.clutch = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [read_counter]
    data.read_counter = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 43;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_can_msgs/MicroBusCan502';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1b8e414429b8dde101c01e1b7adae99';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 cycle_time
    int16 angle_actual
    float64 angle_deg
    int16 velocity_actual
    int16 velocity_average
    int16 velocity_median
    int16 acceleration_actual
    int16 acceleration_average
    int16 acceleration_median
    float64 velocity_mps
    bool clutch
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
    const resolved = new MicroBusCan502(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.cycle_time !== undefined) {
      resolved.cycle_time = msg.cycle_time;
    }
    else {
      resolved.cycle_time = 0.0
    }

    if (msg.angle_actual !== undefined) {
      resolved.angle_actual = msg.angle_actual;
    }
    else {
      resolved.angle_actual = 0
    }

    if (msg.angle_deg !== undefined) {
      resolved.angle_deg = msg.angle_deg;
    }
    else {
      resolved.angle_deg = 0.0
    }

    if (msg.velocity_actual !== undefined) {
      resolved.velocity_actual = msg.velocity_actual;
    }
    else {
      resolved.velocity_actual = 0
    }

    if (msg.velocity_average !== undefined) {
      resolved.velocity_average = msg.velocity_average;
    }
    else {
      resolved.velocity_average = 0
    }

    if (msg.velocity_median !== undefined) {
      resolved.velocity_median = msg.velocity_median;
    }
    else {
      resolved.velocity_median = 0
    }

    if (msg.acceleration_actual !== undefined) {
      resolved.acceleration_actual = msg.acceleration_actual;
    }
    else {
      resolved.acceleration_actual = 0
    }

    if (msg.acceleration_average !== undefined) {
      resolved.acceleration_average = msg.acceleration_average;
    }
    else {
      resolved.acceleration_average = 0
    }

    if (msg.acceleration_median !== undefined) {
      resolved.acceleration_median = msg.acceleration_median;
    }
    else {
      resolved.acceleration_median = 0
    }

    if (msg.velocity_mps !== undefined) {
      resolved.velocity_mps = msg.velocity_mps;
    }
    else {
      resolved.velocity_mps = 0.0
    }

    if (msg.clutch !== undefined) {
      resolved.clutch = msg.clutch;
    }
    else {
      resolved.clutch = false
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

module.exports = MicroBusCan502;
