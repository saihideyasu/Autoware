
(cl:in-package :asdf)

(defsystem "autoware_can_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CANData" :depends-on ("_package_CANData"))
    (:file "_package_CANData" :depends-on ("_package"))
    (:file "CANInfo" :depends-on ("_package_CANInfo"))
    (:file "_package_CANInfo" :depends-on ("_package"))
    (:file "CANPacket" :depends-on ("_package_CANPacket"))
    (:file "_package_CANPacket" :depends-on ("_package"))
    (:file "MicroBusCan501" :depends-on ("_package_MicroBusCan501"))
    (:file "_package_MicroBusCan501" :depends-on ("_package"))
    (:file "MicroBusCan502" :depends-on ("_package_MicroBusCan502"))
    (:file "_package_MicroBusCan502" :depends-on ("_package"))
    (:file "MicroBusCan503" :depends-on ("_package_MicroBusCan503"))
    (:file "_package_MicroBusCan503" :depends-on ("_package"))
    (:file "MicroBusCanSenderStatus" :depends-on ("_package_MicroBusCanSenderStatus"))
    (:file "_package_MicroBusCanSenderStatus" :depends-on ("_package"))
  ))