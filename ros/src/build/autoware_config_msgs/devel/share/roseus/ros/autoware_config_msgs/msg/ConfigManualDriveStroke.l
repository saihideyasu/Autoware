;; Auto-generated. Do not edit!


(when (boundp 'autoware_config_msgs::ConfigManualDriveStroke)
  (if (not (find-package "AUTOWARE_CONFIG_MSGS"))
    (make-package "AUTOWARE_CONFIG_MSGS"))
  (shadow 'ConfigManualDriveStroke (find-package "AUTOWARE_CONFIG_MSGS")))
(unless (find-package "AUTOWARE_CONFIG_MSGS::CONFIGMANUALDRIVESTROKE")
  (make-package "AUTOWARE_CONFIG_MSGS::CONFIGMANUALDRIVESTROKE"))

(in-package "ROS")
;;//! \htmlinclude ConfigManualDriveStroke.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_config_msgs::ConfigManualDriveStroke
  :super ros::object
  :slots (_header _run _drive_stroke _brake_stroke ))

(defmethod autoware_config_msgs::ConfigManualDriveStroke
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:run __run) nil)
    ((:drive_stroke __drive_stroke) 0.0)
    ((:brake_stroke __brake_stroke) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _run __run)
   (setq _drive_stroke (float __drive_stroke))
   (setq _brake_stroke (float __brake_stroke))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:run
   (&optional __run)
   (if __run (setq _run __run)) _run)
  (:drive_stroke
   (&optional __drive_stroke)
   (if __drive_stroke (setq _drive_stroke __drive_stroke)) _drive_stroke)
  (:brake_stroke
   (&optional __brake_stroke)
   (if __brake_stroke (setq _brake_stroke __brake_stroke)) _brake_stroke)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _run
    1
    ;; float64 _drive_stroke
    8
    ;; float64 _brake_stroke
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _run
       (if _run (write-byte -1 s) (write-byte 0 s))
     ;; float64 _drive_stroke
       (sys::poke _drive_stroke (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _brake_stroke
       (sys::poke _brake_stroke (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _run
     (setq _run (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _drive_stroke
     (setq _drive_stroke (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _brake_stroke
     (setq _brake_stroke (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get autoware_config_msgs::ConfigManualDriveStroke :md5sum-) "ac436a8678a2221c76afb687b9d38a53")
(setf (get autoware_config_msgs::ConfigManualDriveStroke :datatype-) "autoware_config_msgs/ConfigManualDriveStroke")
(setf (get autoware_config_msgs::ConfigManualDriveStroke :definition-)
      "Header header
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

")



(provide :autoware_config_msgs/ConfigManualDriveStroke "ac436a8678a2221c76afb687b9d38a53")


