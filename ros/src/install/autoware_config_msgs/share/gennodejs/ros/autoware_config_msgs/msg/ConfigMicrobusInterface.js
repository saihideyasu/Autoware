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

class ConfigMicrobusInterface {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.check_distance_th = null;
      this.check_angular_th = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('check_distance_th')) {
        this.check_distance_th = initObj.check_distance_th
      }
      else {
        this.check_distance_th = 0.0;
      }
      if (initObj.hasOwnProperty('check_angular_th')) {
        this.check_angular_th = initObj.check_angular_th
      }
      else {
        this.check_angular_th = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigMicrobusInterface
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [check_distance_th]
    bufferOffset = _serializer.float64(obj.check_distance_th, buffer, bufferOffset);
    // Serialize message field [check_angular_th]
    bufferOffset = _serializer.float64(obj.check_angular_th, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigMicrobusInterface
    let len;
    let data = new ConfigMicrobusInterface(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [check_distance_th]
    data.check_distance_th = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [check_angular_th]
    data.check_angular_th = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_config_msgs/ConfigMicrobusInterface';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49c0dc484a02daa8ec01ed5e3ccd0ed6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 check_distance_th
    float64 check_angular_th
    
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
    const resolved = new ConfigMicrobusInterface(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.check_distance_th !== undefined) {
      resolved.check_distance_th = msg.check_distance_th;
    }
    else {
      resolved.check_distance_th = 0.0
    }

    if (msg.check_angular_th !== undefined) {
      resolved.check_angular_th = msg.check_angular_th;
    }
    else {
      resolved.check_angular_th = 0.0
    }

    return resolved;
    }
};

module.exports = ConfigMicrobusInterface;
