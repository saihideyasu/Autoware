# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(autoware_config_msgs_CONFIG_INCLUDED)
  return()
endif()
set(autoware_config_msgs_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("FALSE" STREQUAL "TRUE")
  set(autoware_config_msgs_SOURCE_PREFIX /home/autoware/Autoware_1.11.0_sai_edit/ros/src/msgs/autoware_config_msgs)
  set(autoware_config_msgs_DEVEL_PREFIX /home/autoware/Autoware_1.11.0_sai_edit/ros/src/build/autoware_config_msgs/devel)
  set(autoware_config_msgs_INSTALL_PREFIX "")
  set(autoware_config_msgs_PREFIX ${autoware_config_msgs_DEVEL_PREFIX})
else()
  set(autoware_config_msgs_SOURCE_PREFIX "")
  set(autoware_config_msgs_DEVEL_PREFIX "")
  set(autoware_config_msgs_INSTALL_PREFIX /home/autoware/Autoware_1.11.0_sai_edit/ros/src/install/autoware_config_msgs)
  set(autoware_config_msgs_PREFIX ${autoware_config_msgs_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'autoware_config_msgs' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(autoware_config_msgs_FOUND_CATKIN_PROJECT TRUE)

if(NOT "include " STREQUAL " ")
  set(autoware_config_msgs_INCLUDE_DIRS "")
  set(_include_dirs "include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT " " STREQUAL " ")
    set(_report "Check the website '' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Yusuke Fujii <yusuke.fujii@tier4.jp>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${autoware_config_msgs_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'autoware_config_msgs' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'autoware_config_msgs' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/autoware/Autoware_1.11.0_sai_edit/ros/src/install/autoware_config_msgs/${idir}'.  ${_report}")
    endif()
    _list_append_unique(autoware_config_msgs_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND autoware_config_msgs_LIBRARIES ${library})
  elseif(TARGET ${library})
    list(APPEND autoware_config_msgs_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND autoware_config_msgs_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/autoware/Autoware_1.11.0_sai_edit/ros/src/install/autoware_config_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ymc/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/xsens_driver/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lattice_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/waypoint_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/waypoint_maker/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/way_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/trafficlight_recognizer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_utilities/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_simulation_package/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_local_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_global_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_kf_contour_track/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_ros_helpers/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lane_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ff_waypoint_follower/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/dp_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/waypoint_follower/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vlg22c_cam/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_ssd_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_segment_enet_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_lane_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_dpm_ttic_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_darknet_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vision_beyond_track/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vehicle_socket/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vehicle_model/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vehicle_gazebo_simulation_launcher/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vehicle_gazebo_simulation_interface/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vehicle_description/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_simu/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/op_utility/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_euclidean_cluster_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vector_map_server/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/road_occupancy_processor/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/costmap_generator/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/object_map/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/naive_motion_predict/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/map_file/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/libvectormap/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/imm_ukf_pda_track/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/decision_maker/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vector_map/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vector_map_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/vectacam/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/udon_socket/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/twist_to_odom/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/tablet_socket/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/runtime_manager/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/mqtt_socket/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/tablet_socket_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/state_machine_lib/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sound_player/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/signal_creator/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sick_lms5xx/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sick_ldmrs_tools/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sick_ldmrs_driver/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sick_ldmrs_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/sick_ldmrs_description/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/rslidar_driver/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/rslidar_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/points2image/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/calibration_camera_lidar/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/rosinterface/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/rosbag_controller/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/roi_object_filter/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/range_vision_fusion/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/pos_db/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/points_preprocessor/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/points_downsampler/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/pixel_cloud_fusion/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_localizer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/pcl_omp_registration/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/pc2_downsampler/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ouster_ros/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/oculus_socket/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/obj_db/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/novatel_oem7/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/nmea_navsat/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ndt_tku/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ndt_gpu/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ndt_cpu/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/multi_lidar_calibrator/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/microstrain_driver/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/microbus_interface/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/memsic_imu/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/marker_downsampler/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/map_tools/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/map_tf_generator/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/log_tools/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/liesse_model/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_shape_estimation/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_point_pillars/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_naive_l_shape_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_fake_perception/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lidar_apollo_cnn_seg_detect/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/libdpm_ttic/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lgsvl_simulator_bridge/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/lgsvl_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/kvaser/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/kitti_launch/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/kitti_player/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/kitti_box_publisher/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/javad_navsat_driver/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/integrated_viewer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/image_processor/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/hokuyo/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/graph_tools/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/gnss_localizer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/gnss/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/glviewer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/gazebo_world_description/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/gazebo_imu_description/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/gazebo_camera_description/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/garmin/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/freespace_planner/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/fastvirtualscan/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/ekf_localizer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/detected_objects_visualizer/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/decision_maker_panel/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/dbw_mkz_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/data_preprocessor/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/custom_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/calibration_publisher/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/backlight/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_health_checker/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_system_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_rviz_plugins/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_pointgrey_drivers/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_driveworks_interface/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_connector/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_camera_lidar_calibrator/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/astar_search/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/as/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/amathutils_lib/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_launcher_rviz/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_launcher/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_driveworks_gmsl_interface/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_config_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_can_msgs/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_build_flags/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/autoware_bag_tools/lib;/home/autoware/Autoware_1.11.0_sai_edit/ros/install/adi_driver/lib;/opt/ros/kinetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(autoware_config_msgs_LIBRARY_DIRS ${lib_path})
      list(APPEND autoware_config_msgs_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'autoware_config_msgs'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND autoware_config_msgs_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(autoware_config_msgs_EXPORTED_TARGETS "autoware_config_msgs_generate_messages_cpp;autoware_config_msgs_generate_messages_eus;autoware_config_msgs_generate_messages_lisp;autoware_config_msgs_generate_messages_nodejs;autoware_config_msgs_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${autoware_config_msgs_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "message_runtime;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 autoware_config_msgs_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${autoware_config_msgs_dep}_FOUND)
      find_package(${autoware_config_msgs_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${autoware_config_msgs_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(autoware_config_msgs_INCLUDE_DIRS ${${autoware_config_msgs_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(autoware_config_msgs_LIBRARIES ${autoware_config_msgs_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${autoware_config_msgs_dep}_LIBRARIES})
  _list_append_deduplicate(autoware_config_msgs_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(autoware_config_msgs_LIBRARIES ${autoware_config_msgs_LIBRARIES})

  _list_append_unique(autoware_config_msgs_LIBRARY_DIRS ${${autoware_config_msgs_dep}_LIBRARY_DIRS})
  list(APPEND autoware_config_msgs_EXPORTED_TARGETS ${${autoware_config_msgs_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "autoware_config_msgs-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${autoware_config_msgs_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
