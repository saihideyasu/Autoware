;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::GnssStandardDeviation)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'GnssStandardDeviation (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::GNSSSTANDARDDEVIATION")
  (make-package "AUTOWARE_MSGS::GNSSSTANDARDDEVIATION"))

(in-package "ROS")
;;//! \htmlinclude GnssStandardDeviation.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::GnssStandardDeviation
  :super ros::object
  :slots (_header _lat_std _lon_std _alt_std ))

(defmethod autoware_msgs::GnssStandardDeviation
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lat_std __lat_std) 0.0)
    ((:lon_std __lon_std) 0.0)
    ((:alt_std __alt_std) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _lat_std (float __lat_std))
   (setq _lon_std (float __lon_std))
   (setq _alt_std (float __alt_std))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lat_std
   (&optional __lat_std)
   (if __lat_std (setq _lat_std __lat_std)) _lat_std)
  (:lon_std
   (&optional __lon_std)
   (if __lon_std (setq _lon_std __lon_std)) _lon_std)
  (:alt_std
   (&optional __alt_std)
   (if __alt_std (setq _alt_std __alt_std)) _alt_std)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _lat_std
    8
    ;; float64 _lon_std
    8
    ;; float64 _alt_std
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _lat_std
       (sys::poke _lat_std (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lon_std
       (sys::poke _lon_std (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _alt_std
       (sys::poke _alt_std (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _lat_std
     (setq _lat_std (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lon_std
     (setq _lon_std (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _alt_std
     (setq _alt_std (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_msgs::GnssStandardDeviation :md5sum-) "937528f5a93dd6ec62bfd15e4ccdf783")
(setf (get autoware_msgs::GnssStandardDeviation :datatype-) "autoware_msgs/GnssStandardDeviation")
(setf (get autoware_msgs::GnssStandardDeviation :definition-)
      "Header header
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

")



(provide :autoware_msgs/GnssStandardDeviation "937528f5a93dd6ec62bfd15e4ccdf783")


