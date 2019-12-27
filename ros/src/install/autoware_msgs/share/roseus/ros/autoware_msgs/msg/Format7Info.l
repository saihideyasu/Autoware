;; Auto-generated. Do not edit!


(when (boundp 'autoware_msgs::Format7Info)
  (if (not (find-package "AUTOWARE_MSGS"))
    (make-package "AUTOWARE_MSGS"))
  (shadow 'Format7Info (find-package "AUTOWARE_MSGS")))
(unless (find-package "AUTOWARE_MSGS::FORMAT7INFO")
  (make-package "AUTOWARE_MSGS::FORMAT7INFO"))

(in-package "ROS")
;;//! \htmlinclude Format7Info.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass autoware_msgs::Format7Info
  :super ros::object
  :slots (_header _mode _max_width _max_height _offset_hstep_size _offset_vstep_size _image_hstep_size _image_vstep_size _pixel_format_bit_field _vendor_pixel_format_bit_field _packet_size _min_packet_size _max_packet_size _percentage ))

(defmethod autoware_msgs::Format7Info
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mode __mode) 0)
    ((:max_width __max_width) 0)
    ((:max_height __max_height) 0)
    ((:offset_hstep_size __offset_hstep_size) 0)
    ((:offset_vstep_size __offset_vstep_size) 0)
    ((:image_hstep_size __image_hstep_size) 0)
    ((:image_vstep_size __image_vstep_size) 0)
    ((:pixel_format_bit_field __pixel_format_bit_field) 0)
    ((:vendor_pixel_format_bit_field __vendor_pixel_format_bit_field) 0)
    ((:packet_size __packet_size) 0)
    ((:min_packet_size __min_packet_size) 0)
    ((:max_packet_size __max_packet_size) 0)
    ((:percentage __percentage) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _mode (round __mode))
   (setq _max_width (round __max_width))
   (setq _max_height (round __max_height))
   (setq _offset_hstep_size (round __offset_hstep_size))
   (setq _offset_vstep_size (round __offset_vstep_size))
   (setq _image_hstep_size (round __image_hstep_size))
   (setq _image_vstep_size (round __image_vstep_size))
   (setq _pixel_format_bit_field (round __pixel_format_bit_field))
   (setq _vendor_pixel_format_bit_field (round __vendor_pixel_format_bit_field))
   (setq _packet_size (round __packet_size))
   (setq _min_packet_size (round __min_packet_size))
   (setq _max_packet_size (round __max_packet_size))
   (setq _percentage (round __percentage))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:max_width
   (&optional __max_width)
   (if __max_width (setq _max_width __max_width)) _max_width)
  (:max_height
   (&optional __max_height)
   (if __max_height (setq _max_height __max_height)) _max_height)
  (:offset_hstep_size
   (&optional __offset_hstep_size)
   (if __offset_hstep_size (setq _offset_hstep_size __offset_hstep_size)) _offset_hstep_size)
  (:offset_vstep_size
   (&optional __offset_vstep_size)
   (if __offset_vstep_size (setq _offset_vstep_size __offset_vstep_size)) _offset_vstep_size)
  (:image_hstep_size
   (&optional __image_hstep_size)
   (if __image_hstep_size (setq _image_hstep_size __image_hstep_size)) _image_hstep_size)
  (:image_vstep_size
   (&optional __image_vstep_size)
   (if __image_vstep_size (setq _image_vstep_size __image_vstep_size)) _image_vstep_size)
  (:pixel_format_bit_field
   (&optional __pixel_format_bit_field)
   (if __pixel_format_bit_field (setq _pixel_format_bit_field __pixel_format_bit_field)) _pixel_format_bit_field)
  (:vendor_pixel_format_bit_field
   (&optional __vendor_pixel_format_bit_field)
   (if __vendor_pixel_format_bit_field (setq _vendor_pixel_format_bit_field __vendor_pixel_format_bit_field)) _vendor_pixel_format_bit_field)
  (:packet_size
   (&optional __packet_size)
   (if __packet_size (setq _packet_size __packet_size)) _packet_size)
  (:min_packet_size
   (&optional __min_packet_size)
   (if __min_packet_size (setq _min_packet_size __min_packet_size)) _min_packet_size)
  (:max_packet_size
   (&optional __max_packet_size)
   (if __max_packet_size (setq _max_packet_size __max_packet_size)) _max_packet_size)
  (:percentage
   (&optional __percentage)
   (if __percentage (setq _percentage __percentage)) _percentage)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _mode
    4
    ;; uint32 _max_width
    4
    ;; uint32 _max_height
    4
    ;; uint32 _offset_hstep_size
    4
    ;; uint32 _offset_vstep_size
    4
    ;; uint32 _image_hstep_size
    4
    ;; uint32 _image_vstep_size
    4
    ;; uint32 _pixel_format_bit_field
    4
    ;; uint32 _vendor_pixel_format_bit_field
    4
    ;; uint32 _packet_size
    4
    ;; uint32 _min_packet_size
    4
    ;; uint32 _max_packet_size
    4
    ;; uint32 _percentage
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _mode
       (write-long _mode s)
     ;; uint32 _max_width
       (write-long _max_width s)
     ;; uint32 _max_height
       (write-long _max_height s)
     ;; uint32 _offset_hstep_size
       (write-long _offset_hstep_size s)
     ;; uint32 _offset_vstep_size
       (write-long _offset_vstep_size s)
     ;; uint32 _image_hstep_size
       (write-long _image_hstep_size s)
     ;; uint32 _image_vstep_size
       (write-long _image_vstep_size s)
     ;; uint32 _pixel_format_bit_field
       (write-long _pixel_format_bit_field s)
     ;; uint32 _vendor_pixel_format_bit_field
       (write-long _vendor_pixel_format_bit_field s)
     ;; uint32 _packet_size
       (write-long _packet_size s)
     ;; uint32 _min_packet_size
       (write-long _min_packet_size s)
     ;; uint32 _max_packet_size
       (write-long _max_packet_size s)
     ;; uint32 _percentage
       (write-long _percentage s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _max_width
     (setq _max_width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _max_height
     (setq _max_height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _offset_hstep_size
     (setq _offset_hstep_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _offset_vstep_size
     (setq _offset_vstep_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _image_hstep_size
     (setq _image_hstep_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _image_vstep_size
     (setq _image_vstep_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _pixel_format_bit_field
     (setq _pixel_format_bit_field (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _vendor_pixel_format_bit_field
     (setq _vendor_pixel_format_bit_field (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _packet_size
     (setq _packet_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _min_packet_size
     (setq _min_packet_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _max_packet_size
     (setq _max_packet_size (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _percentage
     (setq _percentage (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get autoware_msgs::Format7Info :md5sum-) "f0de8958020c19660d6a288bf7b53a83")
(setf (get autoware_msgs::Format7Info :datatype-) "autoware_msgs/Format7Info")
(setf (get autoware_msgs::Format7Info :definition-)
      "Header header
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

")



(provide :autoware_msgs/Format7Info "f0de8958020c19660d6a288bf7b53a83")


