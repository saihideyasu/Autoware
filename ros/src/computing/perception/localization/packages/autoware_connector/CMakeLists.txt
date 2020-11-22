cmake_minimum_required(VERSION 2.8.3)
project(autoware_connector)

find_package(autoware_msgs REQUIRED)

find_package(catkin REQUIRED COMPONENTS
        autoware_build_flags
        roscpp
        tf
        geometry_msgs
        autoware_msgs
        autoware_can_msgs
        autoware_config_msgs
        autoware_can_msgs
        nav_msgs
        std_msgs
        )


catkin_package(
        INCLUDE_DIRS include
)

include_directories("/usr/include/eigen3")

SET(CMAKE_CXX_FLAGS "-O2 -g -Wall -fpermissive ${CMAKE_CXX_FLAGS}")

include_directories(
        include
        ${catkin_INCLUDE_DIRS}
        ${autoware_msgs_INCLUDE_DIRS}
)

add_executable(can_status_translator
        nodes/can_status_translator/can_status_translator_node.cpp
        nodes/can_status_translator/can_status_translator_core.cpp
        )

target_link_libraries(can_status_translator
        ${catkin_LIBRARIES}
        )

add_dependencies(can_status_translator
        ${catkin_EXPORTED_TARGETS}
        )

add_executable(can_odometry
        nodes/can_odometry/can_odometry_node.cpp
        nodes/can_odometry/can_odometry_core.cpp
        )

target_link_libraries(can_odometry
        ${catkin_LIBRARIES}
        )

add_dependencies(can_odometry
        ${catkin_EXPORTED_TARGETS}
        )

add_executable(current_velocity_conversion
        nodes/current_velocity_conversion/current_velocity_conversion.cpp
        )

target_link_libraries(current_velocity_conversion
        ${catkin_LIBRARIES}
        )

add_dependencies(current_velocity_conversion
        ${catkin_EXPORTED_TARGETS}
        )

add_executable(localizer_switch nodes/localizer_switch/localizer_switch.cpp)
target_link_libraries(localizer_switch ${catkin_LIBRARIES})
add_dependencies(localizer_switch ${catkin_EXPORTED_TARGETS})

add_executable(estimate_to_baselink nodes/estimate_to_baselink/estimate_to_baselink.cpp)
target_link_libraries(estimate_to_baselink ${catkin_LIBRARIES})
add_dependencies(estimate_to_baselink ${catkin_EXPORTED_TARGETS})

install(TARGETS can_status_translator
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS can_odometry
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS localizer_switch
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS current_velocity_conversion
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(TARGETS estimate_to_baselink
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(DIRECTORY launch/
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/launch
        PATTERN ".svn" EXCLUDE)

install(DIRECTORY include/current_velocity_conversion/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})
