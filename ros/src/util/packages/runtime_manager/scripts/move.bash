#!/bin/bash

source /opt/ros/kinetic/setup.bash
source /home/autoware/velodyne_vls/install/setup.bash
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
source /home/autoware/Autoware_1.11.0_sai_edit/ros/install/local_setup.bash
source /home/autoware/.bashrc

sleep 1
echo "source bashrc OK."

# Start
roscore &
sleep 5
echo "roscore OK."

########## Publish topics of /config/* ###########
##### voxel grid filter#####
rostopic pub /config/voxel_grid_filter autoware_config_msgs/ConfigVoxelGridFilter "voxel_leaf_size: 3.0 
measurement_range: 100.0" &
sleep 1
##### ndt matching #####
rostopic pub /config/ndt autoware_config_msgs/ConfigNDT "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
init_pos_gnss: 1
x: 0.0
y: 0.0
z: 0.0
roll: 0.0
pitch: 0.0
yaw: 0.0
use_predict_pose: 1
error_threshold: 1.0
resolution: 3.0
step_size: 0.1
trans_epsilon: 0.01
max_iterations: 30" &
sleep 1
##### can2odom #####
rostopic pub /config/can2odom autoware_config_msgs/ConfigCanOdometry "header:
  seq: 1
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
kmph_th: 0.1" &
sleep 1
##### localizer switch #####
rostopic pub /config/localizer_switch autoware_config_msgs/ConfigLocalizerSwitchFusion "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
fusion_select: 1
localizer_check: 1
yaw_correction1: 2.0
yaw_correction2: 1.0" &
sleep 1
##### current velocity conversion #####
rostopic pub /config/current_velocity_conversion autoware_config_msgs/ConfigCurrentVelocityConversion "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
enable: false
velocity_mode: 4
search_distance: 5.0
search_step: 1.0
search_step_count: 100
constant_velocity: 8.0
velocity_max: 50.0" &
sleep 1
##### lane rule #####
rostopic pub /config/lane_rule autoware_config_msgs/ConfigLaneRule "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
acceleration: 0.4
stopline_search_radius: 1.0
number_of_zeros_ahead: 0
number_of_zeros_behind: 0
number_of_smoothing_count: 0" &
sleep 1
###### lane stop #####
rostopic pub /config/lane_stop autoware_config_msgs/ConfigLaneStop "header:
  seq: 1
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
manual_detection: false" &
sleep 1
##### lane select #####
rostopic pub /config/lane_select autoware_config_msgs/ConfigLaneSelect "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
distance_threshold_neighbor_lanes: 5.0
lane_change_interval: 10.0
lane_change_target_ratio: 5.0
lane_change_target_minimum: 10.0
vector_length_hermite_curve: 10.0" &
sleep 1
##### waypoint loader #####
rostopic pub /config/waypoint_replanner autoware_config_msgs/ConfigWaypointReplanner "{multi_lane_csv: '', replanning_mode: false, velocity_max: 20.0, velocity_min: 4.0,
  accel_limit: 0.5, decel_limit: 0.3, radius_thresh: 20.0, radius_min: 6.0, resample_mode: true,
  resample_interval: 1.0, velocity_offset: 4, end_point_offset: 1, braking_distance: 5,
  replan_curve_mode: false, replan_endpoint_mode: true, overwrite_vmax_mode: false,
  realtime_tuning_mode: false}" &
  sleep 1
##### temporary stopper #####
rostopic pub /config/temporary_stopper autoware_config_msgs/ConfigTemporaryStopper "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
search_distance: 7.0
acceleration: 0.45
number_of_zeros_ahead: 1
number_of_zeros_behind: 0
stop_speed_threshold: 0.025
fixed_velocity: 0.0" &
sleep 1
##### velocity set#####
rostopic pub /config/velocity_set autoware_config_msgs/ConfigVelocitySet "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
stop_distance_obstacle: 7.0
stop_distance_stopline: 5.0
detection_range: 1.10000002384
threshold_points: 8
detection_height_top: 0.10000000149
detection_height_bottom: -1.5
deceleration_obstacle: 0.699999988079
deceleration_stopline: 0.800000011921
velocity_change_limit: 5.0
deceleration_range: 0.0
temporal_waypoints_size: 100.0
use_point_cloud: False
use_point_pillar: False
use_mobileye: True" &
sleep 1
##### lookahead ratio magn #####
rostopic pub /config/lookahead_ratio_magn autoware_config_msgs/ConfigLookAheadRatioMagn "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
max_magn: 1.0
min_magn: 1.0
max_distance: 0.0
min_distance: 0.0" &
sleep 1
##### twist filter #####
rostopic pub /config/twist_filter autoware_config_msgs/ConfigTwistFilter "header:
  seq: 1
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
lateral_accel_limit: 0.8
lowpass_gain_linear_x: 0.0
lowpass_gain_angular_z: 0.0" &
sleep 1
##### microbus can #####
rostopic pub /config/microbus_can autoware_config_msgs/ConfigMicroBusCan "header:
  seq: 1
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
use_position_checker: true
velocity_limit: 55.0
velocity_stop_th: 0.0
accel_max_i: 3000.0
brake_max_i: 500.0
k_accel_p_velocity: 0.12
k_accel_i_velocity: 0.22
k_accel_d_velocity: 0.1
k_brake_p_velocity: 0.32
k_brake_i_velocity: 0.63
k_brake_d_velocity: 0.3
k_accel_p_acceleration: 0.12
k_accel_i_acceleration: 0.0
k_accel_d_acceleration: 0.0
k_brake_p_acceleration: 0.12
k_brake_i_acceleration: 0.0
k_brake_d_acceleration: 0.0
k_accel_p_distance: 0.0
k_accel_i_distance: 0.0
k_accel_d_distance: 0.0
k_brake_p_distance: 0.5
k_brake_i_distance: 0.0
k_brake_d_distance: 0.0
steer_max_i: 100.0
k_steer_p_distance: 130.0
k_steer_i_distance: 0.0
k_steer_d_distance: 0.0
pedal_stroke_center: 0
pedal_stroke_max: 840
pedal_stroke_min: -500
brake_stroke_stopping_med: -300
accel_stroke_offset: 10
brake_stroke_offset: -10
gnss_lat_limit: 0.12
gnss_lon_limit: 0.12
gnss_alt_limit: 0.15
acceptable_velocity_variation: 0.0
ndt_gnss_min_distance_limit: 0.3
ndt_gnss_max_distance_limit: 0.5
ndt_gnss_angle_limit: 10.0
steer_speed_limit1: 100.0
steer_speed_limit2: 60.0
check_distance_th: 0.9
check_angular_th: 20.0
stopper_distance1: 30.0
stopper_distance2: 8.0
stopper_distance3: 2.0
use_lane_left: True
use_lane_right: True
lane_th_left: -5.0
lane_th_right: 5.0
accel_stroke_step_max: 1.5
accel_stroke_step_min: 0.5
brake_stroke_step_max: 2.0
brake_stroke_step_min: 1.0
accel_stroke_adjust_th: 15.0
brake_stroke_adjust_th: 15.0" &

sleep 1
echo "Topics of config has been published."
###################################################

# Load runtime manager
rosrun runtime_manager runtime_manager_dialog.py &
sleep 5
echo "runtime_manager OK."

# Load setup_tf.launch
roslaunch runtime_manager setup_tf.launch x:=3.35 y:=0.0 z:=2.7 yaw:=0.0 pitch:=0.0 roll:=0.0 frame_id:=/base_link child_frame_id:=/velodyne period_in_ms:=10 &
sleep 5
echo "setup_tf OK."

# Load vehicle model
roslaunch vehicle_description vehicle_model.launch model_path:=/home/autoware/Autoware_1.11.0_sai_edit/ros/install/liesse_model/share/liesse_model/urdf/liesse_model.urdf &
sleep 3
echo "vehicle model OK."

# Load vehicle infomation
roslaunch runtime_manager setup_vehicle_info.launch info_path:=/home/autoware/Autoware_1.11.0_sai_edit/ros/src/.config/vehicle_info/liesse_XZB70M.yaml &
sleep 3
echo "vehicle info OK."

# Load points map
rosrun map_file points_map_loader noupdate '/home/autoware/load_data/okabe2/pcd/daigaku_rotari_20190907_norm.pcd' &
sleep 5
echo "points map OK."

# Load vector map
rosrun map_file vector_map_loader data.csv  /home/autoware/load_data/okabe/ADASmap3/ADASmap/area.csv&
sleep 3
echo "vector map OK"

# Load tf_map_to_world.launch
roslaunch '/home/autoware/tf_map_to_world.launch' &
sleep 5
echo "tf map to world OK."

# Set mobileye
roslaunch runtime_manager mobileye.launch kvaser_channel:=0 can_circuit_i:=59879 can_bit_rate:=50000 &
sleep 3
echo "Mobileye OK."

# Set lidar
roslaunch runtime_manager VLS128_points_single.launch calibration:=/home/autoware/velodyne_vls/src/velodyne_pointcloud/params/VeloView_VLS-128_FS1.yaml &
sleep 3
echo "lidar OK."

# Set gnss
roslaunch novatel_oem7 novatel_oem7_tcp.launch __ns:=novatel_oem7_2 ip:=192.168.1.151 &
sleep 3
echo "gnss OK."

# Set points cloud downsample
roslaunch points_downsampler points_downsample.launch node_name:=voxel_grid_filter points_topic:=/points_raw &
sleep 3
echo "points cloud downsample OK."

# Set plane of gnss
roslaunch gnss_localizer nmea2tfpose_RTK2.launch plane:=9 nmea_topic:=/novatel_oem7_2/nmea_sentence name_space:=False &
sleep 3
echo "set nmea2tfpose OK."

# Set gnss localizer
roslaunch gnss_localizer gnss_matching.launch &
sleep 3
echo "gnss localizer OK."

# Set ndt matching
roslaunch lidar_localizer ndt_matching12.launch method_type:=2 use_odom:=True use_imu:=False imu_upside_down:=False imu_topic:=/imu_raw get_height:=True output_log_data:=False &
sleep 3
echo "ndt matching OK."

# Set ndt matching monitor
roslaunch lidar_localizer ndt_matching_monitor.launch iteration_threshold_warn:=10 iteration_threshold_stop:=32 score_threshold_delta:=14 min_stable_samples:=30 fatal_time_threshold:=2 &
sleep 3
echo "ndt monitor OK."

# Set EKF localizer
roslaunch ekf_localizer ekf_localizer.launch show_debug_info:=True enable_yaw_bias_estimation:=True predict_frequency:=10 extend_state_step:=50 use_pose_with_covariance:=False input_pose_name:=/ndt_pose input_pose_with_cov_name:=/ndt_pose_with_covariance pose_additional_delay:=0 pose_measure_uncertainty_time:=0.01 pose_rate:=10 pose_gate_dist:=10000 pose_stddev_x:=0.05 pose_stddev_y:=0.05 pose_stddev_yaw:=0.025 input_twist_name:=/can_velocity twist_additional_delay:=0 twist_rate:=10 twist_gate_dist:=10000 twist_stddev_vx:=0.2 twist_stddev_wz:=0.03 proc_stddev_yaw_c:=0.005 proc_stddev_yaw_bias_c:=0.001 proc_stddev_vx_c:=2 proc_stddev_wz_c:=0.2 &
sleep 3
echo "ekf localizer OK."

# can2odom
roslaunch autoware_connector can2odom.launch kmph_th:=0.1 &
sleep 3
echo "can to odom OK."

# Localizer switch
roslaunch autoware_connector localizer_switch.launch yaw_correction1:=2 yaw_correction2:=0 base_link_pose_topic1:=/ekf_pose estimate_twist_topic1:=/ekf_twist localizer_pose_topic1:=/ndt_localizer_pose alignment_mechanism1:=0 ndt_status_topic1:=/ndt_stat gnss_deviation_topic1:=/gnss_standard_deviation base_link_pose_topic2:=/RTK_gnss_pose estimate_twist_topic2:=/gnss_estimate_twist localizer_pose_topic2:=/gnss_localizer_pose alignment_mechanism2:=1 ndt_status_topic2:=/ndt_stat gnss_deviation_topic2:=/gnss_standard_deviation &
sleep 3
echo "localizer switch OK."

# Current velocity conversion
roslaunch autoware_connector current_velocity_conversion.launch enable:=False search_distance:=50 search_step:=1 &
sleep 3
echo "current localizer conversion OK."

# rviz
rosrun rviz rviz &
sleep 10
echo "rviz OK."

# Lane rule
rosrun lane_planner lane_rule &
sleep 3
echo "lane rule OK."

# Lane stop
rosrun lane_planner lane_stop &
sleep 3
echo "lane stop OK."

# Lane select
roslaunch lane_planner lane_select.launch search_closest_waypoint_minimum_dt:=5 &
sleep 3
echo "lane select OK."

# Waypoint loader show ID
roslaunch waypoint_maker waypoint_loader_show_id.launch load_csv:=True multi_lane_csv:=/home/autoware/load_data/okabe2/liesse_csv/liesse_rotari2.csv replanning_mode:=False realtime_tuning_mode:=True resample_mode:=True resample_interval:=1 replan_curve_mode:=True overwrite_vmax_mode:=True replan_endpoint_mode:=True velocity_max:=50 radius_thresh:=50 radius_min:=6 velocity_min:=4 accel_limit:=0.5 decel_limit:=0.3 velocity_offset:=4 braking_distance:=5 end_point_offset:=1 &
sleep 3
echo "waypoint OK."

# Waypoint param sender
roslaunch waypoint_maker waypoint_param_sender.launch &
sleep 3
echo "waypoint param sender OK."

# astar_avoid
roslaunch waypoint_planner astar_avoid.launch enable_avoidance:=False avoid_waypoints_velocity:=10 avoid_start_velocity:=3 replan_interval:=2 costmap_topic:=semantics/costmap_generator/occupancy_grid &
sleep 3
echo "Astar avoid OK."

# temporary stopper
roslaunch waypoint_planner temporary_stoper_liesse.launch search_distance:=7 acceleration:=0.45 number_of_zeros_ahead:=1 number_of_zeros_behind:=0 stop_speed_threshold:=0.025 fixed_velocity:=0 &
sleep 3
echo "temporary stopper OK."

# velocity set
roslaunch waypoint_planner velocity_set.launch use_crosswalk_detection:=False enable_multiple_crosswalk_detection:=False points_topic:=points_no_ground use_point_cloud:=False use_point_pillar:=False use_mobileye:=True &
sleep 3
echo "velocity set OK."

# mpc follower
roslaunch waypoint_follower mpc_follower.launch show_debug_info:=False publish_debug_values:=False vehicle_model_type:=kinematics qp_solver_type:=unconstraint_fast admisible_position_error:=5 admisible_yaw_error_deg:=90 mpc_prediction_horizon:=70 mpc_prediction_sampling_time:=0.1 mpc_weight_lat_error:=0.1 mpc_weight_terminal_lat_error:=10 mpc_weight_heading_error:=0 mpc_weight_heading_error_squared_vel_coeff:=0.3 mpc_weight_terminal_heading_error:=0.1 mpc_weight_lat_jerk:=0 mpc_weight_steering_input:=1 mpc_weight_steering_input_squared_vel_coeff:=0.25 mpc_zero_ff_steer_deg:=2 enable_path_smoothing:=True path_smoothing_times:=1 path_filter_moving_ave_num:=35 curvature_smoothing_num:=35 steering_lpf_cutoff_hz:=3 vehicle_model_steer_tau:=0.3 vehicle_model_wheelbase:=3.935 steer_lim_deg:=35 &
sleep 3
echo "mpc follower OK."

# lookahead ratio magn
roslaunch waypoint_follower lookahead_ratio_magn.launch max_magn:=1 min_magn:=1 &
sleep 3
echo "lookahead ratio magn OK."

# twist filter
roslaunch waypoint_follower twist_filter.launch &
sleep 3
echo "twist filter OK."

# position checker
roslaunch waypoint_follower position_checker.launch &
sleep 3
echo "position checker OK."

# microbus can stroke
roslaunch vehicle_socket kvaser_microbus_stroke.launch kvaser_channel:=2 speed_limit:=55 velocity_limit:=55 velocity_stop_th:=0 accel_max_i:=3000 brake_max_i:=500 k_accel_p_velocity:=0.12 k_accel_i_velocity:=0.22 k_accel_d_velocity:=0.1 k_brake_p_velocity:=0.32 k_brake_i_velocity:=0.63 k_brake_d_velocity:=0.3 k_accel_p_acceleration:=0.12 k_accel_i_acceleration:=0 k_accel_d_acceleration:=0 k_brake_p_acceleration:=0.12 k_brake_i_acceleration:=0 k_brake_d_acceleration:=0 k_accel_p_distance:=0 k_accel_i_distance:=0 k_accel_d_distance:=0 k_brake_p_distance:=0.5 k_brake_i_distance:=0 k_brake_d_distance:=0 steer_max_i:=100 k_steer_p_distance:=130 k_steer_i_distance:=0 k_steer_d_distance:=0 pedal_stroke_center:=0 pedal_stroke_max:=840 pedal_stroke_min:=-500 brake_stroke_stopping_med:=-300 accel_stroke_offset:=10 brake_stroke_offset:=-10 acceptable_velocity_variation:=0 gnss_lat_limit:=0.12 gnss_lon_limit:=0.12 gnss_alt_limit:=0.15 ndt_gnss_min_distance_limit:=0.3 ndt_gnss_max_distance_limit:=0.5 ndt_gnss_angle_limit:=10 steer_speed_limit1:=100 steer_speed_limit2:=60 check_distance_th:=0.9 check_angular_th:=20 stopper_distance1:=30 stopper_distance2:=8 stopper_distance3:=2 use_lane_left:=True use_lane_right:=True lane_th_left:=-5 lane_th_right:=5 accel_stroke_step_max:=1.5 accel_stroke_step_min:=0.5 brake_stroke_step_max:=1.5 brake_stroke_step_min:=1 accel_stroke_adjust_th:=15 brake_stroke_adjust_th:=15 &
sleep 3
echo "microbus can stroke OK."

# microbus interface stroke
roslaunch microbus_interface microbus_interface.launch &
sleep 3
echo "Everything is OK!!!"
wait
