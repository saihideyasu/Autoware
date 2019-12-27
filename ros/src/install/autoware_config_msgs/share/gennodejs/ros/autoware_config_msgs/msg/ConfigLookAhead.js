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

class ConfigLookAhead {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lookahead_ratio = null;
      this.minimum_lookahead_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigLookAhead
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lookahead_ratio]
    bufferOffset = _serializer.float32(obj.lookahead_ratio, buffer, bufferOffset);
    // Serialize message field [minimum_lookahead_distance]
    bufferOffset = _serializer.float32(obj.minimum_lookahead_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigLookAhead
    let len;
    let data = new ConfigLookAhead(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lookahead_ratio]
    data.lookahead_ratio = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [minimum_lookahead_distance]
    data.minimum_lookahead_distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_config_msgs/ConfigLookAhead';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0bcfee04f0b9a358f42c214f234df83';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32 lookahead_ratio
    float32 minimum_lookahead_distance
    
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
    const resolved = new ConfigLookAhead(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
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

    return resolved;
    }
};

module.exports = ConfigLookAhead;
