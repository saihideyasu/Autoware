// Auto-generated. Do not edit!

// (in-package autoware_config_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ConfigLookAheadRatioMagn {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.max_magn = null;
      this.min_magn = null;
      this.max_distance = null;
      this.min_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('max_magn')) {
        this.max_magn = initObj.max_magn
      }
      else {
        this.max_magn = 0.0;
      }
      if (initObj.hasOwnProperty('min_magn')) {
        this.min_magn = initObj.min_magn
      }
      else {
        this.min_magn = 0.0;
      }
      if (initObj.hasOwnProperty('max_distance')) {
        this.max_distance = initObj.max_distance
      }
      else {
        this.max_distance = 0.0;
      }
      if (initObj.hasOwnProperty('min_distance')) {
        this.min_distance = initObj.min_distance
      }
      else {
        this.min_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigLookAheadRatioMagn
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [max_magn]
    bufferOffset = _serializer.float32(obj.max_magn, buffer, bufferOffset);
    // Serialize message field [min_magn]
    bufferOffset = _serializer.float32(obj.min_magn, buffer, bufferOffset);
    // Serialize message field [max_distance]
    bufferOffset = _serializer.float32(obj.max_distance, buffer, bufferOffset);
    // Serialize message field [min_distance]
    bufferOffset = _serializer.float32(obj.min_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigLookAheadRatioMagn
    let len;
    let data = new ConfigLookAheadRatioMagn(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_magn]
    data.max_magn = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_magn]
    data.min_magn = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_distance]
    data.max_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_distance]
    data.min_distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_config_msgs/ConfigLookAheadRatioMagn';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '356ebf10bda90af1d28c222d65e16400';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 max_magn
    float32 min_magn
    float32 max_distance
    float32 min_distance
    
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
    const resolved = new ConfigLookAheadRatioMagn(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.max_magn !== undefined) {
      resolved.max_magn = msg.max_magn;
    }
    else {
      resolved.max_magn = 0.0
    }

    if (msg.min_magn !== undefined) {
      resolved.min_magn = msg.min_magn;
    }
    else {
      resolved.min_magn = 0.0
    }

    if (msg.max_distance !== undefined) {
      resolved.max_distance = msg.max_distance;
    }
    else {
      resolved.max_distance = 0.0
    }

    if (msg.min_distance !== undefined) {
      resolved.min_distance = msg.min_distance;
    }
    else {
      resolved.min_distance = 0.0
    }

    return resolved;
    }
};

module.exports = ConfigLookAheadRatioMagn;
