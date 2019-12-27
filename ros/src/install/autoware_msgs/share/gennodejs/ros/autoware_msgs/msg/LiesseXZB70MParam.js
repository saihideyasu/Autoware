// Auto-generated. Do not edit!

// (in-package autoware_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class LiesseXZB70MParam {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.shift = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('shift')) {
        this.shift = initObj.shift
      }
      else {
        this.shift = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LiesseXZB70MParam
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [shift]
    bufferOffset = _serializer.int8(obj.shift, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LiesseXZB70MParam
    let len;
    let data = new LiesseXZB70MParam(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [shift]
    data.shift = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/LiesseXZB70MParam';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '299d9ca4a0f481002204559fa398d19d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    int8 SHIFT_P = 0
    int8 SHIFT_R = 1
    int8 SHIFT_N = 2
    int8 SHIFT_D = 3
    int8 SHIFT_4 = 4
    int8 SHIFT_L = 5
    int8 shift
    
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
    const resolved = new LiesseXZB70MParam(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.shift !== undefined) {
      resolved.shift = msg.shift;
    }
    else {
      resolved.shift = 0
    }

    return resolved;
    }
};

// Constants for message
LiesseXZB70MParam.Constants = {
  SHIFT_P: 0,
  SHIFT_R: 1,
  SHIFT_N: 2,
  SHIFT_D: 3,
  SHIFT_4: 4,
  SHIFT_L: 5,
}

module.exports = LiesseXZB70MParam;
