#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <ros/ros.h>
#include <iomanip>
#include <std_msgs/Empty.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Int8.h>
#include <std_msgs/UInt8.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float64.h>
#include <std_msgs/String.h>
#include <can_msgs/Frame.h>
#include <mobileye_560_660_msgs/AftermarketLane.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/TwistStamped.h>
#include <sensor_msgs/Imu.h>
#include <tf/transform_datatypes.h>
#include <autoware_can_msgs/MicroBusCan501.h>
#include <autoware_can_msgs/MicroBusCan502.h>
#include <autoware_can_msgs/MicroBusCan503.h>
#include <autoware_msgs/LocalizerMatchStat.h>
#include <autoware_can_msgs/MicroBusCanSenderStatus.h>
#include <autoware_msgs/DifferenceToWaypointDistance.h>
//#include <autoware_config_msgs/ConfigMicrobusInterface.h>
#include <autoware_config_msgs/ConfigMicroBusCan.h>
#include <autoware_can_msgs/MicroBusCanVelocityParam.h>
#include <autoware_msgs/WaypointParam.h>
#include <autoware_msgs/GnssStandardDeviation.h>
#include <autoware_msgs/NDTStat.h>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(ros::NodeHandle nh, ros::NodeHandle p_nh, QWidget *parent = nullptr);
    ~MainWindow();

    void window_updata();
private:
    const short PEDAL_VOLTAGE_CENTER_ = 1024;//ペダルをニュートラルにしている際の電圧値

    Ui::MainWindow *ui;

    ros::NodeHandle nh_, private_nh_;

    ros::Publisher pub_unlock_;//デバイス立ち上がり時のLOCKを解除
    ros::Publisher pub_drive_mode_, pub_steer_mode_;//autoモードとmanualモードのチェンジ
    ros::Publisher pub_drive_control_;//driveのコントロールモード(velocity操作とstroke操作の切り替え)
    ros::Publisher pub_drive_input_, pub_steer_input_;//programモード時の自動入力と手動入力の切り替え
    ros::Publisher pub_drive_clutch_, pub_steer_clutch_;//クラッチの状態変更フラグ
    ros::Publisher pub_blinker_right_, pub_blinker_left_, pub_blinker_stop_; //ウィンカー
    ros::Publisher pub_error_lock_;//エラーがでている場合、canアプリにロック情報を送る
    ros::Publisher pub_use_safety_localizer_;//localizer関連のセーフティのチェック
    ros::Publisher pub_log_write_, pub_log_stop;//ログ出力通知

    ros::Subscriber sub_can501_, sub_can502_, sub_can503_;//マイクロバスcanのID501,502
    ros::Subscriber sub_can_status_;//canステータス情報
    ros::Subscriber sub_distance_angular_check_, sub_distance_angular_check_ndt_, sub_distance_angular_check_ekf_, sub_distance_angular_check_gnss_;//経路と自車位置のチェック用
    ros::Subscriber sub_config_;
    ros::Subscriber sub_localizer_select_;//localizerの遷移状態 
    ros::Subscriber sub_localizer_match_stat_;//localizerのマッチング状態
    ros::Subscriber sub_can_velocity_param_;//canの速度情報
    ros::Subscriber sub_stopper_distance_;//停止線の位置情報
    ros::Subscriber sub_waypoint_param_;//経路の埋め込み情報
    ros::Subscriber sub_imu_;//IMU情報
    ros::Subscriber sub_gnss_pose_, sub_gnss_deviation_, sub_ndt_stat_, sub_gnss_stat_, sub_ndt_stat_string_;
    ros::Subscriber sub_stroke_routine_;
    ros::Subscriber sub_mobileye_frame_;//mobileyeからのcanの生データ

    void callbackCan501(const autoware_can_msgs::MicroBusCan501 &msg);//マイコン応答ID501
    void callbackCan502(const autoware_can_msgs::MicroBusCan502 &msg);//マイコン応答ID502
    void callbackCan503(const autoware_can_msgs::MicroBusCan503 &msg);//マイコン応答ID502
    void callbackCanStatus(const autoware_can_msgs::MicroBusCanSenderStatus &msg);//canステータス
    void callbackDistanceAngularCheck(const autoware_msgs::DifferenceToWaypointDistance &msg);
    void callbackDistanceAngularCheckNdt(const autoware_msgs::DifferenceToWaypointDistance &msg);
    void callbackDistanceAngularCheckEkf(const autoware_msgs::DifferenceToWaypointDistance &msg);
    void callbackDistanceAngularCheckGnss(const autoware_msgs::DifferenceToWaypointDistance &msg);
    void callbackConfig(const autoware_config_msgs::ConfigMicroBusCan &msg);
    void callbackLocalizerSelect(const std_msgs::Int32 &msg);//localizerの遷移状態 
    void callbackLocalizerMatchStat(const autoware_msgs::LocalizerMatchStat &msg);
    void callbackCanVelocityParam(const autoware_can_msgs::MicroBusCanVelocityParam &msg);
    void callbackStopperDistance(const std_msgs::Float64 &msg);
    void callbackWaypointParam(const autoware_msgs::WaypointParam &msg);
    void callbackImu(const sensor_msgs::Imu &msg);
    void callbackGnssPose(const geometry_msgs::PoseStamped &msg);
    void callbackGnssDeviation(const autoware_msgs::GnssStandardDeviation &msg);
    void callbackNdtStat(const autoware_msgs::NDTStat &msg);
    void callbackGnssStat(const std_msgs::UInt8 &msg);
    void callbackNdtStatString(const std_msgs::String &msg);
    void callbackStrokeRoutine(const std_msgs::String &msg);
    void callbackMobileyeCan(const can_msgs::Frame &msg);

    autoware_can_msgs::MicroBusCan501 can501_;//マイコン応答ID501
    autoware_can_msgs::MicroBusCan502 can502_;//マイコン応答ID502
    autoware_can_msgs::MicroBusCan503 can503_;//マイコン応答ID503
    autoware_can_msgs::MicroBusCanSenderStatus can_status_;//canステータス
    autoware_msgs::DifferenceToWaypointDistance distance_angular_check_, distance_angular_check_ndt_, distance_angular_check_ekf_, distance_angular_check_gnss_;
    geometry_msgs::TwistStamped current_velocity_;//autowareからの現在の速度
    autoware_config_msgs::ConfigMicroBusCan config_;
    int localizer_select_;
    autoware_msgs::LocalizerMatchStat localizer_match_stat_;
    autoware_can_msgs::MicroBusCanVelocityParam can_velocity_param_;
    bool error_text_lock_;
    double stopper_distance_;
    autoware_msgs::WaypointParam waypoint_param_;
    geometry_msgs::PoseStamped gnss_pose_;
    autoware_msgs::GnssStandardDeviation gnss_deviation_;
    autoware_msgs::NDTStat ndt_stat_;
    unsigned char gnss_stat_;
    std::string ndt_stat_string_, stroke_routine_;
    sensor_msgs::Imu imu_;
    mobileye_560_660_msgs::AftermarketLane mobileye_lane_;

    QPalette palette_drive_mode_ok_, palette_steer_mode_ok_;//autoモード表示テキストボックスのバックグラウンドカラーOK
    QPalette palette_drive_mode_error_, palette_steer_mode_error_;//autoモード表示テキストボックスのバックグラウンドカラーerror
    QPalette palette_drive_clutch_connect_, palette_drive_clutch_cut_;//ドライブクラッチのテキストボックスパレット
    QPalette palette_steer_clutch_connect_, palette_steer_clutch_cut_;//ハンドルクラッチのテキストボックスパレット
    QPalette palette_distance_angular_ok_, palette_distance_angular_error_;//経路との距離と角度チェックのテキストボックスパレット
    QPalette palette_localizer_select_ok_, palette_localizer_select_error_;//localizerの遷移状態のテキストボックスパレット
    QPalette palette_gnss_deviation_ok_, palette_gnss_deviation_error_;
    QPalette palette_score_ok_, palette_score_error_;
    QPalette palette_current_localizer_, palette_lb_normal_, palette_lb_localize_;

private slots:
    void publish_emergency_clear();
    void publish_Dmode_manual();
    void publish_Dmode_program();
    void publish_Smode_manual();
    void publish_Smode_program();
    void publish_Dmode_velocity();
    void publish_Dmode_stroke();
    void publish_Dmode_input_direct();
    void publish_Dmode_input_auto();
    void publish_Smode_input_direct();
    void publish_Smode_input_auto();
    void publish_drive_clutch_connect();
    void publish_drive_clutch_cut();
    void publish_steer_clutch_connect();
    void publish_steer_clutch_cut();
    void publish_blinker_right();
    void publish_blinker_left();
    void publish_blinker_stop();
    void publish_use_safety_localizer();
    void publish_log_write();
    void publish_log_stop();
    void click_error_text_reset();
};

#endif // MAINWINDOW_H
