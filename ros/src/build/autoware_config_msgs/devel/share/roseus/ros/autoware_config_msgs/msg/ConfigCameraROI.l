;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigCameraROI)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigCameraROI (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGCAMERAROI")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGCAMERAROI"))

(in-package "ROS")
;;//! \htmlinclude ConfigCameraROI.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigCameraROI
  :super ros::object
  :slots (_header _left _top _width _height ))

(defmethod autoware_config_msgs::ConfigCameraROI
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:left __left) 0)
    ((:top __top) 0)
    ((:width __width) 0)
    ((:height __height) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _left (round __left))
   (setq _top (round __top))
   (setq _width (round __width))
   (setq _height (round __height))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:top
   (&optional __top)
   (if __top (setq _top __top)) _top)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _left
    2
    ;; uint16 _top
    2
    ;; uint16 _width
    2
    ;; uint16 _height
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _left
       (write-word _left s)
     ;; uint16 _top
       (write-word _top s)
     ;; uint16 _width
       (write-word _width s)
     ;; uint16 _height
       (write-word _height s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _left
     (setq _left (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _top
     (setq _top (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _width
     (setq _width (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _height
     (setq _height (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigCameraROI :md5sum-) "8f12abc0cdd10ac3d6959debe69d850c")
(setf (get autoware_config_msgs::ConfigCameraROI :datatype-) "autoware_config_msgs/ConfigCameraROI")
(setf (get autoware_config_msgs::ConfigCameraROI :definition-)
      "Header header
uint16 left
uint16 top
uint16 width
uint16 height

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

")



(provide :autoware_config_msgs/ConfigCameraROI "8f12abc0cdd10ac3d6959debe69d850c")


