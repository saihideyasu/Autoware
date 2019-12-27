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

class ConfigMicroBusCan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.use_position_checker = null;
      this.velocity_limit = null;
      this.velocity_stop_th = null;
      this.accel_max_i = null;
      this.brake_max_i = null;
      this.k_accel_p_velocity = null;
      this.k_accel_i_velocity = null;
      this.k_accel_d_velocity = null;
      this.k_brake_p_velocity = null;
      this.k_brake_i_velocity = null;
      this.k_brake_d_velocity = null;
      this.k_accel_p_acceleration = null;
      this.k_accel_i_acceleration = null;
      this.k_accel_d_acceleration = null;
      this.k_brake_p_acceleration = null;
      this.k_brake_i_acceleration = null;
      this.k_brake_d_acceleration = null;
      this.k_accel_p_distance = null;
      this.k_accel_i_distance = null;
      this.k_accel_d_distance = null;
      this.k_brake_p_distance = null;
      this.k_brake_i_distance = null;
      this.k_brake_d_distance = null;
      this.steer_max_i = null;
      this.k_steer_p_distance = null;
      this.k_steer_i_distance = null;
      this.k_steer_d_distance = null;
      this.pedal_stroke_center = null;
      this.pedal_stroke_max = null;
      this.pedal_stroke_min = null;
      this.brake_stroke_stopping_med = null;
      this.accel_stroke_offset = null;
      this.brake_stroke_offset = null;
      this.gnss_lat_limit = null;
      this.gnss_lon_limit = null;
      this.gnss_alt_limit = null;
      this.acceptable_velocity_variation = null;
      this.difference_to_waypoint_distance = null;
      this.difference_to_waypoint_angular = null;
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
      if (initObj.hasOwnProperty('velocity_limit')) {
        this.velocity_limit = initObj.velocity_limit
      }
      else {
        this.velocity_limit = 0.0;
      }
      if (initObj.hasOwnProperty('velocity_stop_th')) {
        this.velocity_stop_th = initObj.velocity_stop_th
      }
      else {
        this.velocity_stop_th = 0.0;
      }
      if (initObj.hasOwnProperty('accel_max_i')) {
        this.accel_max_i = initObj.accel_max_i
      }
      else {
        this.accel_max_i = 0.0;
      }
      if (initObj.hasOwnProperty('brake_max_i')) {
        this.brake_max_i = initObj.brake_max_i
      }
      else {
        this.brake_max_i = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_p_velocity')) {
        this.k_accel_p_velocity = initObj.k_accel_p_velocity
      }
      else {
        this.k_accel_p_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_i_velocity')) {
        this.k_accel_i_velocity = initObj.k_accel_i_velocity
      }
      else {
        this.k_accel_i_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_d_velocity')) {
        this.k_accel_d_velocity = initObj.k_accel_d_velocity
      }
      else {
        this.k_accel_d_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_p_velocity')) {
        this.k_brake_p_velocity = initObj.k_brake_p_velocity
      }
      else {
        this.k_brake_p_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_i_velocity')) {
        this.k_brake_i_velocity = initObj.k_brake_i_velocity
      }
      else {
        this.k_brake_i_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_d_velocity')) {
        this.k_brake_d_velocity = initObj.k_brake_d_velocity
      }
      else {
        this.k_brake_d_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_p_acceleration')) {
        this.k_accel_p_acceleration = initObj.k_accel_p_acceleration
      }
      else {
        this.k_accel_p_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_i_acceleration')) {
        this.k_accel_i_acceleration = initObj.k_accel_i_acceleration
      }
      else {
        this.k_accel_i_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_d_acceleration')) {
        this.k_accel_d_acceleration = initObj.k_accel_d_acceleration
      }
      else {
        this.k_accel_d_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_p_acceleration')) {
        this.k_brake_p_acceleration = initObj.k_brake_p_acceleration
      }
      else {
        this.k_brake_p_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_i_acceleration')) {
        this.k_brake_i_acceleration = initObj.k_brake_i_acceleration
      }
      else {
        this.k_brake_i_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_d_acceleration')) {
        this.k_brake_d_acceleration = initObj.k_brake_d_acceleration
      }
      else {
        this.k_brake_d_acceleration = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_p_distance')) {
        this.k_accel_p_distance = initObj.k_accel_p_distance
      }
      else {
        this.k_accel_p_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_i_distance')) {
        this.k_accel_i_distance = initObj.k_accel_i_distance
      }
      else {
        this.k_accel_i_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_accel_d_distance')) {
        this.k_accel_d_distance = initObj.k_accel_d_distance
      }
      else {
        this.k_accel_d_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_p_distance')) {
        this.k_brake_p_distance = initObj.k_brake_p_distance
      }
      else {
        this.k_brake_p_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_i_distance')) {
        this.k_brake_i_distance = initObj.k_brake_i_distance
      }
      else {
        this.k_brake_i_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_brake_d_distance')) {
        this.k_brake_d_distance = initObj.k_brake_d_distance
      }
      else {
        this.k_brake_d_distance = 0.0;
      }
      if (initObj.hasOwnProperty('steer_max_i')) {
        this.steer_max_i = initObj.steer_max_i
      }
      else {
        this.steer_max_i = 0.0;
      }
      if (initObj.hasOwnProperty('k_steer_p_distance')) {
        this.k_steer_p_distance = initObj.k_steer_p_distance
      }
      else {
        this.k_steer_p_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_steer_i_distance')) {
        this.k_steer_i_distance = initObj.k_steer_i_distance
      }
      else {
        this.k_steer_i_distance = 0.0;
      }
      if (initObj.hasOwnProperty('k_steer_d_distance')) {
        this.k_steer_d_distance = initObj.k_steer_d_distance
      }
      else {
        this.k_steer_d_distance = 0.0;
      }
      if (initObj.hasOwnProperty('pedal_stroke_center')) {
        this.pedal_stroke_center = initObj.pedal_stroke_center
      }
      else {
        this.pedal_stroke_center = 0;
      }
      if (initObj.hasOwnProperty('pedal_stroke_max')) {
        this.pedal_stroke_max = initObj.pedal_stroke_max
      }
      else {
        this.pedal_stroke_max = 0;
      }
      if (initObj.hasOwnProperty('pedal_stroke_min')) {
        this.pedal_stroke_min = initObj.pedal_stroke_min
      }
      else {
        this.pedal_stroke_min = 0;
      }
      if (initObj.hasOwnProperty('brake_stroke_stopping_med')) {
        this.brake_stroke_stopping_med = initObj.brake_stroke_stopping_med
      }
      else {
        this.brake_stroke_stopping_med = 0;
      }
      if (initObj.hasOwnProperty('accel_stroke_offset')) {
        this.accel_stroke_offset = initObj.accel_stroke_offset
      }
      else {
        this.accel_stroke_offset = 0;
      }
      if (initObj.hasOwnProperty('brake_stroke_offset')) {
        this.brake_stroke_offset = initObj.brake_stroke_offset
      }
      else {
        this.brake_stroke_offset = 0;
      }
      if (initObj.hasOwnProperty('gnss_lat_limit')) {
        this.gnss_lat_limit = initObj.gnss_lat_limit
      }
      else {
        this.gnss_lat_limit = 0.0;
      }
      if (initObj.hasOwnProperty('gnss_lon_limit')) {
        this.gnss_lon_limit = initObj.gnss_lon_limit
      }
      else {
        this.gnss_lon_limit = 0.0;
      }
      if (initObj.hasOwnProperty('gnss_alt_limit')) {
        this.gnss_alt_limit = initObj.gnss_alt_limit
      }
      else {
        this.gnss_alt_limit = 0.0;
      }
      if (initObj.hasOwnProperty('acceptable_velocity_variation')) {
        this.acceptable_velocity_variation = initObj.acceptable_velocity_variation
      }
      else {
        this.acceptable_velocity_variation = 0.0;
      }
      if (initObj.hasOwnProperty('difference_to_waypoint_distance')) {
        this.difference_to_waypoint_distance = initObj.difference_to_waypoint_distance
      }
      else {
        this.difference_to_waypoint_distance = 0.0;
      }
      if (initObj.hasOwnProperty('difference_to_waypoint_angular')) {
        this.difference_to_waypoint_angular = initObj.difference_to_waypoint_angular
      }
      else {
        this.difference_to_waypoint_angular = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ConfigMicroBusCan
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [use_position_checker]
    bufferOffset = _serializer.bool(obj.use_position_checker, buffer, bufferOffset);
    // Serialize message field [velocity_limit]
    bufferOffset = _serializer.float64(obj.velocity_limit, buffer, bufferOffset);
    // Serialize message field [velocity_stop_th]
    bufferOffset = _serializer.float64(obj.velocity_stop_th, buffer, bufferOffset);
    // Serialize message field [accel_max_i]
    bufferOffset = _serializer.float64(obj.accel_max_i, buffer, bufferOffset);
    // Serialize message field [brake_max_i]
    bufferOffset = _serializer.float64(obj.brake_max_i, buffer, bufferOffset);
    // Serialize message field [k_accel_p_velocity]
    bufferOffset = _serializer.float64(obj.k_accel_p_velocity, buffer, bufferOffset);
    // Serialize message field [k_accel_i_velocity]
    bufferOffset = _serializer.float64(obj.k_accel_i_velocity, buffer, bufferOffset);
    // Serialize message field [k_accel_d_velocity]
    bufferOffset = _serializer.float64(obj.k_accel_d_velocity, buffer, bufferOffset);
    // Serialize message field [k_brake_p_velocity]
    bufferOffset = _serializer.float64(obj.k_brake_p_velocity, buffer, bufferOffset);
    // Serialize message field [k_brake_i_velocity]
    bufferOffset = _serializer.float64(obj.k_brake_i_velocity, buffer, bufferOffset);
    // Serialize message field [k_brake_d_velocity]
    bufferOffset = _serializer.float64(obj.k_brake_d_velocity, buffer, bufferOffset);
    // Serialize message field [k_accel_p_acceleration]
    bufferOffset = _serializer.float64(obj.k_accel_p_acceleration, buffer, bufferOffset);
    // Serialize message field [k_accel_i_acceleration]
    bufferOffset = _serializer.float64(obj.k_accel_i_acceleration, buffer, bufferOffset);
    // Serialize message field [k_accel_d_acceleration]
    bufferOffset = _serializer.float64(obj.k_accel_d_acceleration, buffer, bufferOffset);
    // Serialize message field [k_brake_p_acceleration]
    bufferOffset = _serializer.float64(obj.k_brake_p_acceleration, buffer, bufferOffset);
    // Serialize message field [k_brake_i_acceleration]
    bufferOffset = _serializer.float64(obj.k_brake_i_acceleration, buffer, bufferOffset);
    // Serialize message field [k_brake_d_acceleration]
    bufferOffset = _serializer.float64(obj.k_brake_d_acceleration, buffer, bufferOffset);
    // Serialize message field [k_accel_p_distance]
    bufferOffset = _serializer.float64(obj.k_accel_p_distance, buffer, bufferOffset);
    // Serialize message field [k_accel_i_distance]
    bufferOffset = _serializer.float64(obj.k_accel_i_distance, buffer, bufferOffset);
    // Serialize message field [k_accel_d_distance]
    bufferOffset = _serializer.float64(obj.k_accel_d_distance, buffer, bufferOffset);
    // Serialize message field [k_brake_p_distance]
    bufferOffset = _serializer.float64(obj.k_brake_p_distance, buffer, bufferOffset);
    // Serialize message field [k_brake_i_distance]
    bufferOffset = _serializer.float64(obj.k_brake_i_distance, buffer, bufferOffset);
    // Serialize message field [k_brake_d_distance]
    bufferOffset = _serializer.float64(obj.k_brake_d_distance, buffer, bufferOffset);
    // Serialize message field [steer_max_i]
    bufferOffset = _serializer.float64(obj.steer_max_i, buffer, bufferOffset);
    // Serialize message field [k_steer_p_distance]
    bufferOffset = _serializer.float64(obj.k_steer_p_distance, buffer, bufferOffset);
    // Serialize message field [k_steer_i_distance]
    bufferOffset = _serializer.float64(obj.k_steer_i_distance, buffer, bufferOffset);
    // Serialize message field [k_steer_d_distance]
    bufferOffset = _serializer.float64(obj.k_steer_d_distance, buffer, bufferOffset);
    // Serialize message field [pedal_stroke_center]
    bufferOffset = _serializer.int16(obj.pedal_stroke_center, buffer, bufferOffset);
    // Serialize message field [pedal_stroke_max]
    bufferOffset = _serializer.int16(obj.pedal_stroke_max, buffer, bufferOffset);
    // Serialize message field [pedal_stroke_min]
    bufferOffset = _serializer.int16(obj.pedal_stroke_min, buffer, bufferOffset);
    // Serialize message field [brake_stroke_stopping_med]
    bufferOffset = _serializer.int16(obj.brake_stroke_stopping_med, buffer, bufferOffset);
    // Serialize message field [accel_stroke_offset]
    bufferOffset = _serializer.int16(obj.accel_stroke_offset, buffer, bufferOffset);
    // Serialize message field [brake_stroke_offset]
    bufferOffset = _serializer.int16(obj.brake_stroke_offset, buffer, bufferOffset);
    // Serialize message field [gnss_lat_limit]
    bufferOffset = _serializer.float64(obj.gnss_lat_limit, buffer, bufferOffset);
    // Serialize message field [gnss_lon_limit]
    bufferOffset = _serializer.float64(obj.gnss_lon_limit, buffer, bufferOffset);
    // Serialize message field [gnss_alt_limit]
    bufferOffset = _serializer.float64(obj.gnss_alt_limit, buffer, bufferOffset);
    // Serialize message field [acceptable_velocity_variation]
    bufferOffset = _serializer.float64(obj.acceptable_velocity_variation, buffer, bufferOffset);
    // Serialize message field [difference_to_waypoint_distance]
    bufferOffset = _serializer.float64(obj.difference_to_waypoint_distance, buffer, bufferOffset);
    // Serialize message field [difference_to_waypoint_angular]
    bufferOffset = _serializer.float64(obj.difference_to_waypoint_angular, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ConfigMicroBusCan
    let len;
    let data = new ConfigMicroBusCan(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [use_position_checker]
    data.use_position_checker = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [velocity_limit]
    data.velocity_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [velocity_stop_th]
    data.velocity_stop_th = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [accel_max_i]
    data.accel_max_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [brake_max_i]
    data.brake_max_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_p_velocity]
    data.k_accel_p_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_i_velocity]
    data.k_accel_i_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_d_velocity]
    data.k_accel_d_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_p_velocity]
    data.k_brake_p_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_i_velocity]
    data.k_brake_i_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_d_velocity]
    data.k_brake_d_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_p_acceleration]
    data.k_accel_p_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_i_acceleration]
    data.k_accel_i_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_d_acceleration]
    data.k_accel_d_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_p_acceleration]
    data.k_brake_p_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_i_acceleration]
    data.k_brake_i_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_d_acceleration]
    data.k_brake_d_acceleration = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_p_distance]
    data.k_accel_p_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_i_distance]
    data.k_accel_i_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_accel_d_distance]
    data.k_accel_d_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_p_distance]
    data.k_brake_p_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_i_distance]
    data.k_brake_i_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_brake_d_distance]
    data.k_brake_d_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [steer_max_i]
    data.steer_max_i = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_steer_p_distance]
    data.k_steer_p_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_steer_i_distance]
    data.k_steer_i_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_steer_d_distance]
    data.k_steer_d_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pedal_stroke_center]
    data.pedal_stroke_center = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pedal_stroke_max]
    data.pedal_stroke_max = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [pedal_stroke_min]
    data.pedal_stroke_min = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [brake_stroke_stopping_med]
    data.brake_stroke_stopping_med = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [accel_stroke_offset]
    data.accel_stroke_offset = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [brake_stroke_offset]
    data.brake_stroke_offset = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [gnss_lat_limit]
    data.gnss_lat_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gnss_lon_limit]
    data.gnss_lon_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [gnss_alt_limit]
    data.gnss_alt_limit = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [acceptable_velocity_variation]
    data.acceptable_velocity_variation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [difference_to_waypoint_distance]
    data.difference_to_waypoint_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [difference_to_waypoint_angular]
    data.difference_to_waypoint_angular = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 269;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_config_msgs/ConfigMicroBusCan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26c6999f9bd3f4e18f1576c259a99941';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    bool use_position_checker
    float64 velocity_limit
    float64 velocity_stop_th
    float64 accel_max_i
    float64 brake_max_i
    float64 k_accel_p_velocity
    float64 k_accel_i_velocity
    float64 k_accel_d_velocity
    float64 k_brake_p_velocity
    float64 k_brake_i_velocity
    float64 k_brake_d_velocity
    float64 k_accel_p_acceleration
    float64 k_accel_i_acceleration
    float64 k_accel_d_acceleration
    float64 k_brake_p_acceleration
    float64 k_brake_i_acceleration
    float64 k_brake_d_acceleration
    float64 k_accel_p_distance
    float64 k_accel_i_distance
    float64 k_accel_d_distance
    float64 k_brake_p_distance
    float64 k_brake_i_distance
    float64 k_brake_d_distance
    float64 steer_max_i
    float64 k_steer_p_distance
    float64 k_steer_i_distance
    float64 k_steer_d_distance
    int16 pedal_stroke_center
    int16 pedal_stroke_max
    int16 pedal_stroke_min
    int16 brake_stroke_stopping_med
    int16 accel_stroke_offset
    int16 brake_stroke_offset
    float64 gnss_lat_limit
    float64 gnss_lon_limit
    float64 gnss_alt_limit
    float64 acceptable_velocity_variation
    float64 difference_to_waypoint_distance
    float64 difference_to_waypoint_angular
    
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
    const resolved = new ConfigMicroBusCan(null);
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

    if (msg.velocity_limit !== undefined) {
      resolved.velocity_limit = msg.velocity_limit;
    }
    else {
      resolved.velocity_limit = 0.0
    }

    if (msg.velocity_stop_th !== undefined) {
      resolved.velocity_stop_th = msg.velocity_stop_th;
    }
    else {
      resolved.velocity_stop_th = 0.0
    }

    if (msg.accel_max_i !== undefined) {
      resolved.accel_max_i = msg.accel_max_i;
    }
    else {
      resolved.accel_max_i = 0.0
    }

    if (msg.brake_max_i !== undefined) {
      resolved.brake_max_i = msg.brake_max_i;
    }
    else {
      resolved.brake_max_i = 0.0
    }

    if (msg.k_accel_p_velocity !== undefined) {
      resolved.k_accel_p_velocity = msg.k_accel_p_velocity;
    }
    else {
      resolved.k_accel_p_velocity = 0.0
    }

    if (msg.k_accel_i_velocity !== undefined) {
      resolved.k_accel_i_velocity = msg.k_accel_i_velocity;
    }
    else {
      resolved.k_accel_i_velocity = 0.0
    }

    if (msg.k_accel_d_velocity !== undefined) {
      resolved.k_accel_d_velocity = msg.k_accel_d_velocity;
    }
    else {
      resolved.k_accel_d_velocity = 0.0
    }

    if (msg.k_brake_p_velocity !== undefined) {
      resolved.k_brake_p_velocity = msg.k_brake_p_velocity;
    }
    else {
      resolved.k_brake_p_velocity = 0.0
    }

    if (msg.k_brake_i_velocity !== undefined) {
      resolved.k_brake_i_velocity = msg.k_brake_i_velocity;
    }
    else {
      resolved.k_brake_i_velocity = 0.0
    }

    if (msg.k_brake_d_velocity !== undefined) {
      resolved.k_brake_d_velocity = msg.k_brake_d_velocity;
    }
    else {
      resolved.k_brake_d_velocity = 0.0
    }

    if (msg.k_accel_p_acceleration !== undefined) {
      resolved.k_accel_p_acceleration = msg.k_accel_p_acceleration;
    }
    else {
      resolved.k_accel_p_acceleration = 0.0
    }

    if (msg.k_accel_i_acceleration !== undefined) {
      resolved.k_accel_i_acceleration = msg.k_accel_i_acceleration;
    }
    else {
      resolved.k_accel_i_acceleration = 0.0
    }

    if (msg.k_accel_d_acceleration !== undefined) {
      resolved.k_accel_d_acceleration = msg.k_accel_d_acceleration;
    }
    else {
      resolved.k_accel_d_acceleration = 0.0
    }

    if (msg.k_brake_p_acceleration !== undefined) {
      resolved.k_brake_p_acceleration = msg.k_brake_p_acceleration;
    }
    else {
      resolved.k_brake_p_acceleration = 0.0
    }

    if (msg.k_brake_i_acceleration !== undefined) {
      resolved.k_brake_i_acceleration = msg.k_brake_i_acceleration;
    }
    else {
      resolved.k_brake_i_acceleration = 0.0
    }

    if (msg.k_brake_d_acceleration !== undefined) {
      resolved.k_brake_d_acceleration = msg.k_brake_d_acceleration;
    }
    else {
      resolved.k_brake_d_acceleration = 0.0
    }

    if (msg.k_accel_p_distance !== undefined) {
      resolved.k_accel_p_distance = msg.k_accel_p_distance;
    }
    else {
      resolved.k_accel_p_distance = 0.0
    }

    if (msg.k_accel_i_distance !== undefined) {
      resolved.k_accel_i_distance = msg.k_accel_i_distance;
    }
    else {
      resolved.k_accel_i_distance = 0.0
    }

    if (msg.k_accel_d_distance !== undefined) {
      resolved.k_accel_d_distance = msg.k_accel_d_distance;
    }
    else {
      resolved.k_accel_d_distance = 0.0
    }

    if (msg.k_brake_p_distance !== undefined) {
      resolved.k_brake_p_distance = msg.k_brake_p_distance;
    }
    else {
      resolved.k_brake_p_distance = 0.0
    }

    if (msg.k_brake_i_distance !== undefined) {
      resolved.k_brake_i_distance = msg.k_brake_i_distance;
    }
    else {
      resolved.k_brake_i_distance = 0.0
    }

    if (msg.k_brake_d_distance !== undefined) {
      resolved.k_brake_d_distance = msg.k_brake_d_distance;
    }
    else {
      resolved.k_brake_d_distance = 0.0
    }

    if (msg.steer_max_i !== undefined) {
      resolved.steer_max_i = msg.steer_max_i;
    }
    else {
      resolved.steer_max_i = 0.0
    }

    if (msg.k_steer_p_distance !== undefined) {
      resolved.k_steer_p_distance = msg.k_steer_p_distance;
    }
    else {
      resolved.k_steer_p_distance = 0.0
    }

    if (msg.k_steer_i_distance !== undefined) {
      resolved.k_steer_i_distance = msg.k_steer_i_distance;
    }
    else {
      resolved.k_steer_i_distance = 0.0
    }

    if (msg.k_steer_d_distance !== undefined) {
      resolved.k_steer_d_distance = msg.k_steer_d_distance;
    }
    else {
      resolved.k_steer_d_distance = 0.0
    }

    if (msg.pedal_stroke_center !== undefined) {
      resolved.pedal_stroke_center = msg.pedal_stroke_center;
    }
    else {
      resolved.pedal_stroke_center = 0
    }

    if (msg.pedal_stroke_max !== undefined) {
      resolved.pedal_stroke_max = msg.pedal_stroke_max;
    }
    else {
      resolved.pedal_stroke_max = 0
    }

    if (msg.pedal_stroke_min !== undefined) {
      resolved.pedal_stroke_min = msg.pedal_stroke_min;
    }
    else {
      resolved.pedal_stroke_min = 0
    }

    if (msg.brake_stroke_stopping_med !== undefined) {
      resolved.brake_stroke_stopping_med = msg.brake_stroke_stopping_med;
    }
    else {
      resolved.brake_stroke_stopping_med = 0
    }

    if (msg.accel_stroke_offset !== undefined) {
      resolved.accel_stroke_offset = msg.accel_stroke_offset;
    }
    else {
      resolved.accel_stroke_offset = 0
    }

    if (msg.brake_stroke_offset !== undefined) {
      resolved.brake_stroke_offset = msg.brake_stroke_offset;
    }
    else {
      resolved.brake_stroke_offset = 0
    }

    if (msg.gnss_lat_limit !== undefined) {
      resolved.gnss_lat_limit = msg.gnss_lat_limit;
    }
    else {
      resolved.gnss_lat_limit = 0.0
    }

    if (msg.gnss_lon_limit !== undefined) {
      resolved.gnss_lon_limit = msg.gnss_lon_limit;
    }
    else {
      resolved.gnss_lon_limit = 0.0
    }

    if (msg.gnss_alt_limit !== undefined) {
      resolved.gnss_alt_limit = msg.gnss_alt_limit;
    }
    else {
      resolved.gnss_alt_limit = 0.0
    }

    if (msg.acceptable_velocity_variation !== undefined) {
      resolved.acceptable_velocity_variation = msg.acceptable_velocity_variation;
    }
    else {
      resolved.acceptable_velocity_variation = 0.0
    }

    if (msg.difference_to_waypoint_distance !== undefined) {
      resolved.difference_to_waypoint_distance = msg.difference_to_waypoint_distance;
    }
    else {
      resolved.difference_to_waypoint_distance = 0.0
    }

    if (msg.difference_to_waypoint_angular !== undefined) {
      resolved.difference_to_waypoint_angular = msg.difference_to_waypoint_angular;
    }
    else {
      resolved.difference_to_waypoint_angular = 0.0
    }

    return resolved;
    }
};

module.exports = ConfigMicroBusCan;
