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

class MicroBusCanSenderStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.use_position_checker = null;
      this.use_input_steer = null;
      this.use_input_drive = null;
      this.use_velocity_topic = null;
      this.position_check_stop = null;
      this.angle_limit_over = null;
      this.safety_error_message = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('use_position_checker')) {
        this.use_position_checker = initObj.use_position_checker
      }
      else {
        this.use_position_checker = false;
      }
      if (initObj.hasOwnProperty('use_input_steer')) {
        this.use_input_steer = initObj.use_input_steer
      }
      else {
        this.use_input_steer = false;
      }
      if (initObj.hasOwnProperty('use_input_drive')) {
        this.use_input_drive = initObj.use_input_drive
      }
      else {
        this.use_input_drive = false;
      }
      if (initObj.hasOwnProperty('use_velocity_topic')) {
        this.use_velocity_topic = initObj.use_velocity_topic
      }
      else {
        this.use_velocity_topic = 0;
      }
      if (initObj.hasOwnProperty('position_check_stop')) {
        this.position_check_stop = initObj.position_check_stop
      }
      else {
        this.position_check_stop = false;
      }
      if (initObj.hasOwnProperty('angle_limit_over')) {
        this.angle_limit_over = initObj.angle_limit_over
      }
      else {
        this.angle_limit_over = false;
      }
      if (initObj.hasOwnProperty('safety_error_message')) {
        this.safety_error_message = initObj.safety_error_message
      }
      else {
        this.safety_error_message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MicroBusCanSenderStatus
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [use_position_checker]
    bufferOffset = _serializer.bool(obj.use_position_checker, buffer, bufferOffset);
    // Serialize message field [use_input_steer]
    bufferOffset = _serializer.bool(obj.use_input_steer, buffer, bufferOffset);
    // Serialize message field [use_input_drive]
    bufferOffset = _serializer.bool(obj.use_input_drive, buffer, bufferOffset);
    // Serialize message field [use_velocity_topic]
    bufferOffset = _serializer.int8(obj.use_velocity_topic, buffer, bufferOffset);
    // Serialize message field [position_check_stop]
    bufferOffset = _serializer.bool(obj.position_check_stop, buffer, bufferOffset);
    // Serialize message field [angle_limit_over]
    bufferOffset = _serializer.bool(obj.angle_limit_over, buffer, bufferOffset);
    // Serialize message field [safety_error_message]
    bufferOffset = _serializer.string(obj.safety_error_message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MicroBusCanSenderStatus
    let len;
    let data = new MicroBusCanSenderStatus(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [use_position_checker]
    data.use_position_checker = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [use_input_steer]
    data.use_input_steer = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [use_input_drive]
    data.use_input_drive = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [use_velocity_topic]
    data.use_velocity_topic = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [position_check_stop]
    data.position_check_stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [angle_limit_over]
    data.angle_limit_over = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [safety_error_message]
    data.safety_error_message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += object.safety_error_message.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_can_msgs/MicroBusCanSenderStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e657452a5005d3b21b85259e5ca2de3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool use_position_checker
    bool use_input_steer
    bool use_input_drive
    int8 use_velocity_topic
    bool position_check_stop
    bool angle_limit_over
    string safety_error_message
    
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
    const resolved = new MicroBusCanSenderStatus(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.use_position_checker !== undefined) {
      resolved.use_position_checker = msg.use_position_checker;
    }
    else {
      resolved.use_position_checker = false
    }

    if (msg.use_input_steer !== undefined) {
      resolved.use_input_steer = msg.use_input_steer;
    }
    else {
      resolved.use_input_steer = false
    }

    if (msg.use_input_drive !== undefined) {
      resolved.use_input_drive = msg.use_input_drive;
    }
    else {
      resolved.use_input_drive = false
    }

    if (msg.use_velocity_topic !== undefined) {
      resolved.use_velocity_topic = msg.use_velocity_topic;
    }
    else {
      resolved.use_velocity_topic = 0
    }

    if (msg.position_check_stop !== undefined) {
      resolved.position_check_stop = msg.position_check_stop;
    }
    else {
      resolved.position_check_stop = false
    }

    if (msg.angle_limit_over !== undefined) {
      resolved.angle_limit_over = msg.angle_limit_over;
    }
    else {
      resolved.angle_limit_over = false
    }

    if (msg.safety_error_message !== undefined) {
      resolved.safety_error_message = msg.safety_error_message;
    }
    else {
      resolved.safety_error_message = ''
    }

    return resolved;
    }
};

module.exports = MicroBusCanSenderStatus;
