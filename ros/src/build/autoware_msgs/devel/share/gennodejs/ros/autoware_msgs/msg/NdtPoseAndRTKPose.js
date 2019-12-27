// Auto-generated. Do not edit!

// (in-package autoware_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GnssStandardDeviation = require('./GnssStandardDeviation.js');
let NDTStat = require('./NDTStat.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class NdtPoseAndRTKPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ndt_pose = null;
      this.ndt_localizer_pose = null;
      this.ndt_twist = null;
      this.RTK_pose = null;
      this.RTK_localizer_pose = null;
      this.RTK_standard_deviation = null;
      this.ndt_stat = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ndt_pose')) {
        this.ndt_pose = initObj.ndt_pose
      }
      else {
        this.ndt_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('ndt_localizer_pose')) {
        this.ndt_localizer_pose = initObj.ndt_localizer_pose
      }
      else {
        this.ndt_localizer_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('ndt_twist')) {
        this.ndt_twist = initObj.ndt_twist
      }
      else {
        this.ndt_twist = new geometry_msgs.msg.TwistStamped();
      }
      if (initObj.hasOwnProperty('RTK_pose')) {
        this.RTK_pose = initObj.RTK_pose
      }
      else {
        this.RTK_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('RTK_localizer_pose')) {
        this.RTK_localizer_pose = initObj.RTK_localizer_pose
      }
      else {
        this.RTK_localizer_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('RTK_standard_deviation')) {
        this.RTK_standard_deviation = initObj.RTK_standard_deviation
      }
      else {
        this.RTK_standard_deviation = new GnssStandardDeviation();
      }
      if (initObj.hasOwnProperty('ndt_stat')) {
        this.ndt_stat = initObj.ndt_stat
      }
      else {
        this.ndt_stat = new NDTStat();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NdtPoseAndRTKPose
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ndt_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.ndt_pose, buffer, bufferOffset);
    // Serialize message field [ndt_localizer_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.ndt_localizer_pose, buffer, bufferOffset);
    // Serialize message field [ndt_twist]
    bufferOffset = geometry_msgs.msg.TwistStamped.serialize(obj.ndt_twist, buffer, bufferOffset);
    // Serialize message field [RTK_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.RTK_pose, buffer, bufferOffset);
    // Serialize message field [RTK_localizer_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.RTK_localizer_pose, buffer, bufferOffset);
    // Serialize message field [RTK_standard_deviation]
    bufferOffset = GnssStandardDeviation.serialize(obj.RTK_standard_deviation, buffer, bufferOffset);
    // Serialize message field [ndt_stat]
    bufferOffset = NDTStat.serialize(obj.ndt_stat, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NdtPoseAndRTKPose
    let len;
    let data = new NdtPoseAndRTKPose(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ndt_pose]
    data.ndt_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [ndt_localizer_pose]
    data.ndt_localizer_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [ndt_twist]
    data.ndt_twist = geometry_msgs.msg.TwistStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [RTK_pose]
    data.RTK_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [RTK_localizer_pose]
    data.RTK_localizer_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [RTK_standard_deviation]
    data.RTK_standard_deviation = GnssStandardDeviation.deserialize(buffer, bufferOffset);
    // Deserialize message field [ndt_stat]
    data.ndt_stat = NDTStat.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.ndt_pose);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.ndt_localizer_pose);
    length += geometry_msgs.msg.TwistStamped.getMessageSize(object.ndt_twist);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.RTK_pose);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.RTK_localizer_pose);
    length += GnssStandardDeviation.getMessageSize(object.RTK_standard_deviation);
    length += NDTStat.getMessageSize(object.ndt_stat);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'autoware_msgs/NdtPoseAndRTKPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '04033cc2ccf6e18ada42ff3baad16dfb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/PoseStamped ndt_pose
    geometry_msgs/PoseStamped ndt_localizer_pose
    geometry_msgs/TwistStamped ndt_twist
    geometry_msgs/PoseStamped RTK_pose
    geometry_msgs/PoseStamped RTK_localizer_pose
    autoware_msgs/GnssStandardDeviation RTK_standard_deviation
    autoware_msgs/NDTStat ndt_stat
    
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
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/TwistStamped
    # A twist with reference coordinate frame and timestamp
    Header header
    Twist twist
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: autoware_msgs/GnssStandardDeviation
    Header header
    float64 lat_std
    float64 lon_std
    float64 alt_std
    
    ================================================================================
    MSG: autoware_msgs/NDTStat
    Header header
    float32 exe_time
    int32 iteration
    float32 score
    float32 velocity
    float32 acceleration
    int32 use_predict_pose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NdtPoseAndRTKPose(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ndt_pose !== undefined) {
      resolved.ndt_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.ndt_pose)
    }
    else {
      resolved.ndt_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.ndt_localizer_pose !== undefined) {
      resolved.ndt_localizer_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.ndt_localizer_pose)
    }
    else {
      resolved.ndt_localizer_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.ndt_twist !== undefined) {
      resolved.ndt_twist = geometry_msgs.msg.TwistStamped.Resolve(msg.ndt_twist)
    }
    else {
      resolved.ndt_twist = new geometry_msgs.msg.TwistStamped()
    }

    if (msg.RTK_pose !== undefined) {
      resolved.RTK_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.RTK_pose)
    }
    else {
      resolved.RTK_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.RTK_localizer_pose !== undefined) {
      resolved.RTK_localizer_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.RTK_localizer_pose)
    }
    else {
      resolved.RTK_localizer_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.RTK_standard_deviation !== undefined) {
      resolved.RTK_standard_deviation = GnssStandardDeviation.Resolve(msg.RTK_standard_deviation)
    }
    else {
      resolved.RTK_standard_deviation = new GnssStandardDeviation()
    }

    if (msg.ndt_stat !== undefined) {
      resolved.ndt_stat = NDTStat.Resolve(msg.ndt_stat)
    }
    else {
      resolved.ndt_stat = new NDTStat()
    }

    return resolved;
    }
};

module.exports = NdtPoseAndRTKPose;
