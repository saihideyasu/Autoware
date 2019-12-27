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

class MicroBusCan503 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pedal_voltage = null;
      this.pedal_displacement = null;
      this.engine_rotation = null;
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
      if (initObj.hasOwnProperty('pedal_voltage')) {
        this.pedal_voltage = initObj.pedal_voltage
      }
      else {
        this.pedal_voltage = 0;
      }
      if (initObj.hasOwnProperty('pedal_displacement')) {
        this.pedal_displacement = initObj.pedal_displacement
      }
      else {
        this.pedal_displacement = 0;
      }
      if (initObj.hasOwnProperty('engine_rotation')) {
        this.engine_rotation = initObj.engine_rotation
      }
      else {
        this.engine_rotation = 0;
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
    // Serializes a message object of type MicroBusCan503
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pedal_voltage]
    bufferOffset = _serializer.int16(obj.pedal_voltage, buffer, bufferOffset);
    // Serialize message field [pedal_displacement]
    bufferOffset = _serializer.int16(obj.pedal_displacement, buffer, bufferOffset);
    // Serialize message field [engine_rotation]
    bufferOffset = _serializer.int16(obj.engine_rotation, buffer, bufferOffset);
    // Serialize message field [clutch]
    bufferOffset = _serializer.bool(obj.clutch, buffer, bufferOffset);
    // Serialize message field [read_counter]
    bufferOffset = _serializer.uint32(obj.read_counter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MicroBusCan503
    let len;
    let data = new MicroBusCan503(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pedal_voltage]
    data.pedal_voltage = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pedal_displacement]
    data.pedal_displacement = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [engine_rotation]
    data.engine_rotation = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [clutch]
    data.clutch = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [read_counter]
    data.read_counter = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_can_msgs/MicroBusCan503';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '574e15f63e6b6b35ed4b724a0cd43a84';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int16 pedal_voltage
    int16 pedal_displacement
    int16 engine_rotation
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
    const resolved = new MicroBusCan503(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pedal_voltage !== undefined) {
      resolved.pedal_voltage = msg.pedal_voltage;
    }
    else {
      resolved.pedal_voltage = 0
    }

    if (msg.pedal_displacement !== undefined) {
      resolved.pedal_displacement = msg.pedal_displacement;
    }
    else {
      resolved.pedal_displacement = 0
    }

    if (msg.engine_rotation !== undefined) {
      resolved.engine_rotation = msg.engine_rotation;
    }
    else {
      resolved.engine_rotation = 0
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

module.exports = MicroBusCan503;
