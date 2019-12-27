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

class ConfigManualDriveStroke {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.run = null;
      this.drive_stroke = null;
      this.brake_stroke = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('run')) {
        this.run = initObj.run
      }
      else {
        this.run = false;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigManualDriveStroke
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [run]
    bufferOffset = _serializer.bool(obj.run, buffer, bufferOffset);
    // Serialize message field [drive_stroke]
    bufferOffset = _serializer.float64(obj.drive_stroke, buffer, bufferOffset);
    // Serialize message field [brake_stroke]
    bufferOffset = _serializer.float64(obj.brake_stroke, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigManualDriveStroke
    let len;
    let data = new ConfigManualDriveStroke(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [run]
    data.run = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drive_stroke]
    data.drive_stroke = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake_stroke]
    data.brake_stroke = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_config_msgs/ConfigManualDriveStroke';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac436a8678a2221c76afb687b9d38a53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool run
    float64 drive_stroke
    float64 brake_stroke
    
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
    const resolved = new ConfigManualDriveStroke(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.run !== undefined) {
      resolved.run = msg.run;
    }
    else {
      resolved.run = false
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

    return resolved;
    }
};

module.exports = ConfigManualDriveStroke;
