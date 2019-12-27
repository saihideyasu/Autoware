;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigLookAheadRatioMagn)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigLookAheadRatioMagn (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGLOOKAHEADRATIOMAGN")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGLOOKAHEADRATIOMAGN"))

(in-package "ROS")
;;//! \htmlinclude ConfigLookAheadRatioMagn.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigLookAheadRatioMagn
  :super ros::object
  :slots (_header _max_magn _min_magn _max_distance _min_distance ))

(defmethod autoware_config_msgs::ConfigLookAheadRatioMagn
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:max_magn __max_magn) 0.0)
    ((:min_magn __min_magn) 0.0)
    ((:max_distance __max_distance) 0.0)
    ((:min_distance __min_distance) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _max_magn (float __max_magn))
   (setq _min_magn (float __min_magn))
   (setq _max_distance (float __max_distance))
   (setq _min_distance (float __min_distance))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:max_magn
   (&optional __max_magn)
   (if __max_magn (setq _max_magn __max_magn)) _max_magn)
  (:min_magn
   (&optional __min_magn)
   (if __min_magn (setq _min_magn __min_magn)) _min_magn)
  (:max_distance
   (&optional __max_distance)
   (if __max_distance (setq _max_distance __max_distance)) _max_distance)
  (:min_distance
   (&optional __min_distance)
   (if __min_distance (setq _min_distance __min_distance)) _min_distance)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _max_magn
    4
    ;; float32 _min_magn
    4
    ;; float32 _max_distance
    4
    ;; float32 _min_distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _max_magn
       (sys::poke _max_magn (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_magn
       (sys::poke _min_magn (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_distance
       (sys::poke _max_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_distance
       (sys::poke _min_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _max_magn
     (setq _max_magn (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_magn
     (setq _min_magn (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_distance
     (setq _max_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_distance
     (setq _min_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigLookAheadRatioMagn :md5sum-) "356ebf10bda90af1d28c222d65e16400")
(setf (get autoware_config_msgs::ConfigLookAheadRatioMagn :datatype-) "autoware_config_msgs/ConfigLookAheadRatioMagn")
(setf (get autoware_config_msgs::ConfigLookAheadRatioMagn :definition-)
      "Header header
float32 max_magn
float32 min_magn
float32 max_distance
float32 min_distance

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



(provide :autoware_config_msgs/ConfigLookAheadRatioMagn "356ebf10bda90af1d28c222d65e16400")


