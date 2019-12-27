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

class GnssStandardDeviation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lat_std = null;
      this.lon_std = null;
      this.alt_std = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lat_std')) {
        this.lat_std = initObj.lat_std
      }
      else {
        this.lat_std = 0.0;
      }
      if (initObj.hasOwnProperty('lon_std')) {
        this.lon_std = initObj.lon_std
      }
      else {
        this.lon_std = 0.0;
      }
      if (initObj.hasOwnProperty('alt_std')) {
        this.alt_std = initObj.alt_std
      }
      else {
        this.alt_std = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GnssStandardDeviation
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lat_std]
    bufferOffset = _serializer.float64(obj.lat_std, buffer, bufferOffset);
    // Serialize message field [lon_std]
    bufferOffset = _serializer.float64(obj.lon_std, buffer, bufferOffset);
    // Serialize message field [alt_std]
    bufferOffset = _serializer.float64(obj.alt_std, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GnssStandardDeviation
    let len;
    let data = new GnssStandardDeviation(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lat_std]
    data.lat_std = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lon_std]
    data.lon_std = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [alt_std]
    data.alt_std = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/GnssStandardDeviation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937528f5a93dd6ec62bfd15e4ccdf783';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 lat_std
    float64 lon_std
    float64 alt_std
    
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
    const resolved = new GnssStandardDeviation(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lat_std !== undefined) {
      resolved.lat_std = msg.lat_std;
    }
    else {
      resolved.lat_std = 0.0
    }

    if (msg.lon_std !== undefined) {
      resolved.lon_std = msg.lon_std;
    }
    else {
      resolved.lon_std = 0.0
    }

    if (msg.alt_std !== undefined) {
      resolved.alt_std = msg.alt_std;
    }
    else {
      resolved.alt_std = 0.0
    }

    return resolved;
    }
};

module.exports = GnssStandardDeviation;
