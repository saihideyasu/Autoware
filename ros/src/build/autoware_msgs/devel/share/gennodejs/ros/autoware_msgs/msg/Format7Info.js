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

class Format7Info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.mode = null;
      this.max_width = null;
      this.max_height = null;
      this.offset_hstep_size = null;
      this.offset_vstep_size = null;
      this.image_hstep_size = null;
      this.image_vstep_size = null;
      this.pixel_format_bit_field = null;
      this.vendor_pixel_format_bit_field = null;
      this.packet_size = null;
      this.min_packet_size = null;
      this.max_packet_size = null;
      this.percentage = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('max_width')) {
        this.max_width = initObj.max_width
      }
      else {
        this.max_width = 0;
      }
      if (initObj.hasOwnProperty('max_height')) {
        this.max_height = initObj.max_height
      }
      else {
        this.max_height = 0;
      }
      if (initObj.hasOwnProperty('offset_hstep_size')) {
        this.offset_hstep_size = initObj.offset_hstep_size
      }
      else {
        this.offset_hstep_size = 0;
      }
      if (initObj.hasOwnProperty('offset_vstep_size')) {
        this.offset_vstep_size = initObj.offset_vstep_size
      }
      else {
        this.offset_vstep_size = 0;
      }
      if (initObj.hasOwnProperty('image_hstep_size')) {
        this.image_hstep_size = initObj.image_hstep_size
      }
      else {
        this.image_hstep_size = 0;
      }
      if (initObj.hasOwnProperty('image_vstep_size')) {
        this.image_vstep_size = initObj.image_vstep_size
      }
      else {
        this.image_vstep_size = 0;
      }
      if (initObj.hasOwnProperty('pixel_format_bit_field')) {
        this.pixel_format_bit_field = initObj.pixel_format_bit_field
      }
      else {
        this.pixel_format_bit_field = 0;
      }
      if (initObj.hasOwnProperty('vendor_pixel_format_bit_field')) {
        this.vendor_pixel_format_bit_field = initObj.vendor_pixel_format_bit_field
      }
      else {
        this.vendor_pixel_format_bit_field = 0;
      }
      if (initObj.hasOwnProperty('packet_size')) {
        this.packet_size = initObj.packet_size
      }
      else {
        this.packet_size = 0;
      }
      if (initObj.hasOwnProperty('min_packet_size')) {
        this.min_packet_size = initObj.min_packet_size
      }
      else {
        this.min_packet_size = 0;
      }
      if (initObj.hasOwnProperty('max_packet_size')) {
        this.max_packet_size = initObj.max_packet_size
      }
      else {
        this.max_packet_size = 0;
      }
      if (initObj.hasOwnProperty('percentage')) {
        this.percentage = initObj.percentage
      }
      else {
        this.percentage = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Format7Info
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint32(obj.mode, buffer, bufferOffset);
    // Serialize message field [max_width]
    bufferOffset = _serializer.uint32(obj.max_width, buffer, bufferOffset);
    // Serialize message field [max_height]
    bufferOffset = _serializer.uint32(obj.max_height, buffer, bufferOffset);
    // Serialize message field [offset_hstep_size]
    bufferOffset = _serializer.uint32(obj.offset_hstep_size, buffer, bufferOffset);
    // Serialize message field [offset_vstep_size]
    bufferOffset = _serializer.uint32(obj.offset_vstep_size, buffer, bufferOffset);
    // Serialize message field [image_hstep_size]
    bufferOffset = _serializer.uint32(obj.image_hstep_size, buffer, bufferOffset);
    // Serialize message field [image_vstep_size]
    bufferOffset = _serializer.uint32(obj.image_vstep_size, buffer, bufferOffset);
    // Serialize message field [pixel_format_bit_field]
    bufferOffset = _serializer.uint32(obj.pixel_format_bit_field, buffer, bufferOffset);
    // Serialize message field [vendor_pixel_format_bit_field]
    bufferOffset = _serializer.uint32(obj.vendor_pixel_format_bit_field, buffer, bufferOffset);
    // Serialize message field [packet_size]
    bufferOffset = _serializer.uint32(obj.packet_size, buffer, bufferOffset);
    // Serialize message field [min_packet_size]
    bufferOffset = _serializer.uint32(obj.min_packet_size, buffer, bufferOffset);
    // Serialize message field [max_packet_size]
    bufferOffset = _serializer.uint32(obj.max_packet_size, buffer, bufferOffset);
    // Serialize message field [percentage]
    bufferOffset = _serializer.uint32(obj.percentage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Format7Info
    let len;
    let data = new Format7Info(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [max_width]
    data.max_width = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [max_height]
    data.max_height = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [offset_hstep_size]
    data.offset_hstep_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [offset_vstep_size]
    data.offset_vstep_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [image_hstep_size]
    data.image_hstep_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [image_vstep_size]
    data.image_vstep_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [pixel_format_bit_field]
    data.pixel_format_bit_field = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [vendor_pixel_format_bit_field]
    data.vendor_pixel_format_bit_field = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [packet_size]
    data.packet_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [min_packet_size]
    data.min_packet_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [max_packet_size]
    data.max_packet_size = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [percentage]
    data.percentage = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/Format7Info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f0de8958020c19660d6a288bf7b53a83';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint32 mode
    uint32 max_width
    uint32 max_height
    uint32 offset_hstep_size
    uint32 offset_vstep_size
    uint32 image_hstep_size
    uint32 image_vstep_size
    uint32 pixel_format_bit_field
    uint32 vendor_pixel_format_bit_field
    uint32 packet_size
    uint32 min_packet_size
    uint32 max_packet_size
    uint32 percentage
    
    
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
    const resolved = new Format7Info(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.max_width !== undefined) {
      resolved.max_width = msg.max_width;
    }
    else {
      resolved.max_width = 0
    }

    if (msg.max_height !== undefined) {
      resolved.max_height = msg.max_height;
    }
    else {
      resolved.max_height = 0
    }

    if (msg.offset_hstep_size !== undefined) {
      resolved.offset_hstep_size = msg.offset_hstep_size;
    }
    else {
      resolved.offset_hstep_size = 0
    }

    if (msg.offset_vstep_size !== undefined) {
      resolved.offset_vstep_size = msg.offset_vstep_size;
    }
    else {
      resolved.offset_vstep_size = 0
    }

    if (msg.image_hstep_size !== undefined) {
      resolved.image_hstep_size = msg.image_hstep_size;
    }
    else {
      resolved.image_hstep_size = 0
    }

    if (msg.image_vstep_size !== undefined) {
      resolved.image_vstep_size = msg.image_vstep_size;
    }
    else {
      resolved.image_vstep_size = 0
    }

    if (msg.pixel_format_bit_field !== undefined) {
      resolved.pixel_format_bit_field = msg.pixel_format_bit_field;
    }
    else {
      resolved.pixel_format_bit_field = 0
    }

    if (msg.vendor_pixel_format_bit_field !== undefined) {
      resolved.vendor_pixel_format_bit_field = msg.vendor_pixel_format_bit_field;
    }
    else {
      resolved.vendor_pixel_format_bit_field = 0
    }

    if (msg.packet_size !== undefined) {
      resolved.packet_size = msg.packet_size;
    }
    else {
      resolved.packet_size = 0
    }

    if (msg.min_packet_size !== undefined) {
      resolved.min_packet_size = msg.min_packet_size;
    }
    else {
      resolved.min_packet_size = 0
    }

    if (msg.max_packet_size !== undefined) {
      resolved.max_packet_size = msg.max_packet_size;
    }
    else {
      resolved.max_packet_size = 0
    }

    if (msg.percentage !== undefined) {
      resolved.percentage = msg.percentage;
    }
    else {
      resolved.percentage = 0
    }

    return resolved;
    }
};

module.exports = Format7Info;
