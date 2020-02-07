#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(ros::NodeHandle nh, ros::NodeHandle p_nh, QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow),
    localizer_select_(-1)
{
    ui->setupUi(this);

    ui->gb_shift->setVisible(false);
    ui->gb_velocity->setVisible(false);

    palette_drive_mode_ok_ = ui->tx_drive_mode->palette();
    palette_steer_mode_ok_ = ui->tx_steer_mode->palette();
    palette_drive_clutch_connect_ = ui->tx_drive_clutch->palette();
    palette_steer_clutch_connect_ = ui->tx_steer_clutch->palette();
    palette_distance_angular_ok_ = ui->tx_distance_check->palette();
    palette_localizer_select_ok_ = ui->tx_localizer_select->palette();
    palette_gnss_deviation_ok_ = ui->tx_lat->palette();
    palette_score_ok_ = ui->tx_ndt_score->palette();
    palette_lb_normal_ = ui->lb2_ndt->palette();
    palette_drive_mode_error_ = palette_drive_mode_ok_;
    palette_steer_mode_error_ = palette_steer_mode_ok_;
    palette_drive_clutch_cut_ = palette_drive_clutch_connect_;
    palette_steer_clutch_cut_ = palette_steer_clutch_connect_;
    palette_distance_angular_error_ = palette_distance_angular_ok_;
    palette_localizer_select_error_ = palette_localizer_select_ok_;
    palette_gnss_deviation_error_ = palette_gnss_deviation_ok_;
    palette_score_error_ = palette_score_ok_;
    palette_current_localizer_ = palette_localizer_select_ok_;
    palette_lb_localize_ = palette_lb_normal_;
    palette_drive_mode_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_steer_mode_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_drive_clutch_cut_.setColor(QPalette::Base, QColor("#00FF00"));
    palette_steer_clutch_cut_.setColor(QPalette::Base, QColor("#00FF00"));
    palette_distance_angular_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_distance_angular_ok_.setColor(QPalette::Base, QColor("#00FFFF"));
    palette_localizer_select_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_gnss_deviation_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_score_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_current_localizer_.setColor(QPalette::Base, QColor("#00FF00"));
    palette_lb_localize_.setColor(QPalette::Base, QColor("#00FF00"));
    ui->lb2_ndt->setPalette(palette_lb_localize_);
    ui->lb2_ekf->setPalette(palette_lb_localize_);
    ui->lb2_gnss->setPalette(palette_lb_localize_);

    connect(ui->bt_emergency_clear, SIGNAL(clicked()), this, SLOT(publish_emergency_clear()));
    connect(ui->bt_drive_mode_manual, SIGNAL(clicked()), this, SLOT(publish_Dmode_manual()));
    connect(ui->bt_drive_mode_program, SIGNAL(clicked()), this, SLOT(publish_Dmode_program()));
    connect(ui->bt_drive_control_mode_velocity, SIGNAL(clicked()), this, SLOT(publish_Dmode_velocity()));
    connect(ui->bt_drive_control_mode_stroke, SIGNAL(clicked()), this, SLOT(publish_Dmode_stroke()));
    connect(ui->bt_drive_input_mode_direct, SIGNAL(clicked()), this, SLOT(publish_Dmode_input_direct()));
    connect(ui->bt_drive_input_mode_autoware, SIGNAL(clicked()), this, SLOT(publish_Dmode_input_auto()));
    connect(ui->bt_steer_mode_manual, SIGNAL(clicked()), this, SLOT(publish_Smode_manual()));
    connect(ui->bt_steer_mode_program, SIGNAL(clicked()), this, SLOT(publish_Smode_program()));
    connect(ui->bt_steer_input_mode_direct, SIGNAL(clicked()), this, SLOT(publish_Smode_input_direct()));
    connect(ui->bt_steer_input_mode_autoware, SIGNAL(clicked()), this, SLOT(publish_Smode_input_auto()));
    connect(ui->bt_drive_clutch_connect, SIGNAL(clicked()), this, SLOT(publish_drive_clutch_connect()));
    connect(ui->bt_drive_clutch_cut, SIGNAL(clicked()), this, SLOT(publish_drive_clutch_cut()));
    connect(ui->bt_steer_clutch_connect, SIGNAL(clicked()), this, SLOT(publish_steer_clutch_connect()));
    connect(ui->bt_steer_clutch_cut, SIGNAL(clicked()), this, SLOT(publish_steer_clutch_cut()));
    connect(ui->bt_error_text_reset, SIGNAL(clicked()), this, SLOT(click_error_text_reset()));
    connect(ui->bt_blinker_right_on, SIGNAL(clicked()), this, SLOT(publish_blinker_right()));
    connect(ui->bt_blinker_left_on, SIGNAL(clicked()), this, SLOT(publish_blinker_left()));
    connect(ui->bt_blinker_right_off, SIGNAL(clicked()), this, SLOT(publish_blinker_stop()));
    connect(ui->bt_blinker_left_off, SIGNAL(clicked()), this, SLOT(publish_blinker_stop()));
    connect(ui->bt2_blinker_right, SIGNAL(clicked()), this, SLOT(publish_blinker_right()));
    connect(ui->bt2_blinker_left, SIGNAL(clicked()), this, SLOT(publish_blinker_left()));
    connect(ui->bt2_blinker_stop, SIGNAL(clicked()), this, SLOT(publish_blinker_stop()));
    connect(ui->bt2_error_clear, SIGNAL(clicked()), this, SLOT(click_error_text_reset()));
    connect(ui->bt2_drive_on,SIGNAL(clicked()), this, SLOT(publish_Dmode_program()));
    connect(ui->bt2_steer_on,SIGNAL(clicked()), this, SLOT(publish_Smode_program()));
    connect(ui->bt2_drive_off,SIGNAL(clicked()), this, SLOT(publish_Dmode_manual()));
    connect(ui->bt2_steer_off,SIGNAL(clicked()), this, SLOT(publish_Smode_manual()));
    connect(ui->cb_use_localizer_safety, SIGNAL(clicked()), this, SLOT(publish_use_safety_localizer()));

    nh_ = nh;  private_nh_ = p_nh;

    pub_unlock_ = nh_.advertise<std_msgs::Empty>("/microbus/emergency_reset", 1);
    pub_drive_mode_ = nh_.advertise<std_msgs::Bool>("/microbus/drive_mode_send", 1);
    pub_drive_control_ = nh_.advertise<std_msgs::Int8>("/microbus/drive_control", 1);
    pub_steer_mode_ = nh_.advertise<std_msgs::Bool>("/microbus/steer_mode_send", 1);
    pub_drive_input_ = nh_.advertise<std_msgs::Bool>("/microbus/input_drive_flag", 1);
    pub_steer_input_ = nh_.advertise<std_msgs::Bool>("/microbus/input_steer_flag", 1);
    pub_drive_clutch_ = nh_.advertise<std_msgs::Bool>("/microbus/drive_clutch", 1);
    pub_steer_clutch_ = nh_.advertise<std_msgs::Bool>("/microbus/steer_clutch", 1);
    pub_blinker_left_ = nh_.advertise<std_msgs::Bool>("/microbus/blinker_left", 1);
    pub_blinker_right_ = nh_.advertise<std_msgs::Bool>("/microbus/blinker_right", 1);
    pub_blinker_stop_ = nh_.advertise<std_msgs::Bool>("/microbus/blinker_stop", 1);
    pub_error_lock_ = nh_.advertise<std_msgs::Bool>("/microbus/interface_lock", 1);
    pub_use_safety_localizer_ = nh_.advertise<std_msgs::Bool>("/microbus/use_safety_localizer", 1, true);

    sub_can501_ = nh_.subscribe("/microbus/can_receive501", 10, &MainWindow::callbackCan501, this);
    sub_can502_ = nh_.subscribe("/microbus/can_receive502", 10, &MainWindow::callbackCan502, this);
    sub_can503_ = nh_.subscribe("/microbus/can_receive503", 10, &MainWindow::callbackCan503, this);
    sub_can_status_ = nh_.subscribe("/microbus/can_sender_status", 10, &MainWindow::callbackCanStatus, this);
    sub_distance_angular_check_ = nh_.subscribe("/difference_to_waypoint_distance", 10, &MainWindow::callbackDistanceAngularCheck, this);
    sub_distance_angular_check_ndt_ = nh_.subscribe("/difference_to_waypoint_distance_ndt", 10, &MainWindow::callbackDistanceAngularCheckNdt, this);
    sub_distance_angular_check_ekf_ = nh_.subscribe("/difference_to_waypoint_distance_ekf", 10, &MainWindow::callbackDistanceAngularCheckEkf, this);
    sub_distance_angular_check_gnss_ = nh_.subscribe("/difference_to_waypoint_distance_gnss", 10, &MainWindow::callbackDistanceAngularCheckGnss, this);
    sub_config_ = nh_.subscribe("/config/microbus_can", 10, &MainWindow::callbackConfig, this);
    sub_localizer_select_ = nh_.subscribe("/localizer_select_num", 10, &MainWindow::callbackLocalizerSelect, this);
    sub_localizer_match_stat_ = nh_.subscribe("/microbus/localizer_match_stat", 10, &MainWindow::callbackLocalizerMatchStat, this);
    sub_can_velocity_param_ = nh_.subscribe("/microbus/velocity_param", 10, &MainWindow::callbackCanVelocityParam, this);
    sub_stopper_distance_ = nh_.subscribe("/stopper_distance", 10, &MainWindow::callbackStopperDistance, this);
    sub_waypoint_param_ = nh_.subscribe("/waypoint_param", 10, &MainWindow::callbackWaypointParam, this);
    sub_imu_ = nh_.subscribe("/gnss_imu", 10, &MainWindow::callbackImu, this);
    sub_gnss_pose_ = nh_.subscribe("/gnss_pose", 10, &MainWindow::callbackGnssPose, this);
    sub_gnss_deviation_ = nh_.subscribe("/gnss_standard_deviation", 10, &MainWindow::callbackGnssDeviation, this);
    sub_ndt_stat_ = nh_.subscribe("/ndt_stat", 10, &MainWindow::callbackNdtStat, this);
    sub_gnss_stat_ = nh_.subscribe("/gnss_stat", 10, &MainWindow::callbackGnssStat, this);
    sub_ndt_stat_string_ = nh.subscribe("/ndt_monitor/ndt_status", 10 , &MainWindow::callbackNdtStatString, this);
    sub_stroke_routine_ = nh.subscribe("/microbus/stroke_routine", 10 , &MainWindow::callbackStrokeRoutine, this);
    sub_mobileye_frame_ = nh.subscribe("/can_tx", 10 , &MainWindow::callbackMobileyeCan, this);

    can_status_.angle_limit_over = can_status_.position_check_stop = true;
    error_text_lock_ = false;
    distance_angular_check_.baselink_distance = 10000;
    distance_angular_check_.baselink_angular = 180;
    distance_angular_check_ndt_.baselink_distance = 10000;
    distance_angular_check_ndt_.baselink_angular = 180;
    distance_angular_check_ekf_.baselink_distance = 10000;
    distance_angular_check_ekf_.baselink_angular = 180;
    distance_angular_check_gnss_.baselink_distance = 10000;
    distance_angular_check_gnss_.baselink_angular = 180;
    stopper_distance_ = -1;

    publish_use_safety_localizer();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::window_updata()
{
    const int keta = 3;
    bool unlock_flag = (can501_.emergency == false) ? true : false;

    ui->bt_drive_mode_manual->setEnabled(unlock_flag);
    ui->bt_drive_mode_program->setEnabled(unlock_flag);
    ui->bt_steer_mode_manual->setEnabled(unlock_flag);
    ui->bt_steer_mode_program->setEnabled(unlock_flag);
    ui->bt_blinker_left_on->setEnabled(unlock_flag);
    ui->bt_blinker_left_off->setEnabled(unlock_flag);
    ui->bt_blinker_right_on->setEnabled(unlock_flag);
    ui->bt_blinker_right_off->setEnabled(unlock_flag);
    ui->bt_drive_clutch_connect->setEnabled(unlock_flag);
    ui->bt_drive_clutch_cut->setEnabled(unlock_flag);
    ui->bt_steer_clutch_connect->setEnabled(unlock_flag);
    ui->bt_steer_clutch_cut->setEnabled(unlock_flag);

    if(unlock_flag)
    {
        //driveモードの状態
        std::stringstream str_drive_target;
        str_drive_target << can501_.velocity;
        ui->tx_stroke_target->setText(str_drive_target.str().c_str());
        ui->tx2_drive_stroke_target->setText(str_drive_target.str().c_str());

        double stroke = PEDAL_VOLTAGE_CENTER_ - can503_.pedal_voltage;
        std::stringstream str_drive_actual;
        str_drive_actual << stroke;
        ui->tx_stroke_actual->setText(str_drive_actual.str().c_str());
        ui->tx2_drive_stroke_actual->setText(str_drive_actual.str().c_str());

        std::stringstream str_velocity;
        str_velocity << can502_.velocity_actual / 100;
        ui->tx_velocity_actual->setText(str_velocity.str().c_str());

        if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_AUTO)
        {
            ui->tx_drive_mode->setPalette(palette_drive_mode_ok_);
            ui->tx_drive_mode->setText("auto");
            ui->tx2_drive_mode->setPalette(palette_drive_mode_ok_);
            ui->tx2_drive_mode->setText("auto");
            ui->bt_drive_control_mode_velocity->setEnabled(true);
            ui->bt_drive_control_mode_stroke->setEnabled(true);
            ui->bt_drive_input_mode_direct->setEnabled(true);
            ui->bt_drive_input_mode_autoware->setEnabled(true);

            if(can501_.drive_mode == autoware_can_msgs::MicroBusCan501::DRIVE_MODE_VELOCITY)
            {
                //ui->gb_velocity->setEnabled(true);
                //ui->gb_stroke->setEnabled(false);
                ui->tx_drive_control_mode->setText("velocity");
            }
            else if(can501_.drive_mode == autoware_can_msgs::MicroBusCan501::DRIVE_MODE_STROKE)
            {
                //ui->gb_velocity->setEnabled(false);
                //ui->gb_stroke->setEnabled(true);
                ui->tx_drive_control_mode->setText("stroke");

                /*std::stringstream str_target;
                str_target << can501_.velocity;
                ui->tx_stroke_target->setText(str_target.str().c_str());

                double stroke = PEDAL_VOLTAGE_CENTER_ - can503_.pedal_voltage;
                std::stringstream str_actual;
                str_actual << stroke;
                ui->tx_stroke_actual->setText(str_actual.str().c_str());*/
            }
            else
            {
                //ui->gb_velocity->setEnabled(false);
                //ui->gb_stroke->setEnabled(false);
                ui->tx_drive_control_mode->setText("undefined");
            }
        }
        else
        {
            ui->tx_drive_control_mode->setText("none");
            ui->bt_drive_control_mode_velocity->setEnabled(false);
            ui->bt_drive_control_mode_stroke->setEnabled(false);
            ui->tx_drive_control_mode->setText("");
            ui->bt_drive_input_mode_direct->setEnabled(false);
            ui->bt_drive_input_mode_autoware->setEnabled(false);
            ui->tx_drive_input_mode->setText("");
            //ui->gb_velocity->setEnabled(false);
            //ui->gb_stroke->setEnabled(false);

            if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0)
            {
                ui->tx_drive_mode->setPalette(palette_drive_mode_ok_);
                ui->tx_drive_mode->setText("V0");
                ui->tx2_drive_mode->setPalette(palette_drive_mode_ok_);
                ui->tx2_drive_mode->setText("V0");
            }
            else
            {
                ui->tx_drive_mode->setPalette(palette_drive_mode_error_);
                ui->tx2_drive_mode->setPalette(palette_drive_mode_error_);
                if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_V0)
                {
                    ui->tx_drive_mode->setText("not V0");
                    ui->tx2_drive_mode->setText("not V0");
                }
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER)
                {
                    ui->tx_drive_mode->setText("not joy center");
                    ui->tx2_drive_mode->setText("not joy center");
                }
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                {
                    ui->tx_drive_mode->setText("not board res");
                    ui->tx2_drive_mode->setText("not board res");
                }
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0 + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER)
                {
                    ui->tx_drive_mode->setText("not V0\nnot joy center");
                    ui->tx2_drive_mode->setText("not V0\nnot joy center");
                }
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0 + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                {
                    ui->tx_drive_mode->setText("not V0\nnot board res");
                    ui->tx2_drive_mode->setText("not V0\nnot board res");
                }
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                {
                    ui->tx_drive_mode->setText("not joy cente\nnot board res");
                    ui->tx2_drive_mode->setText("not joy cente\nnot board res");
                }
                else
                {
                    ui->tx_drive_mode->setText("undefined");
                    ui->tx2_drive_mode->setText("undefined");
                }
            }
        }

        //steerモードの状態
        std::stringstream str_steer_target;
        str_steer_target << can501_.steering_angle;
        ui->tx_angle_target->setText(str_steer_target.str().c_str());
        ui->tx2_steer_angle_target->setText(str_steer_target.str().c_str());

        std::stringstream str_steer_actual;
        str_steer_actual << can502_.angle_actual;
        ui->tx_angle_actual->setText(str_steer_actual.str().c_str());
        ui->tx2_steer_angle_actual->setText(str_steer_actual.str().c_str());

        if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_AUTO)
        {
            ui->tx_steer_mode->setPalette(palette_steer_mode_ok_);
            ui->tx_steer_mode->setText("auto");
            ui->tx2_steer_mode->setPalette(palette_steer_mode_ok_);
            ui->tx2_steer_mode->setText("auto");
            ui->bt_steer_input_mode_direct->setEnabled(true);
            ui->bt_steer_input_mode_autoware->setEnabled(true);
            //ui->gb_angle->setEnabled(true);

            /*std::stringstream str_target;
            str_target << can501_.steering_angle;
            ui->tx_angle_target->setText(str_target.str().c_str());

            std::stringstream str_actual;
            str_actual << can502_.angle_actual;
            ui->tx_angle_actual->setText(str_actual.str().c_str());*/
        }
        else
        {
            ui->bt_steer_input_mode_direct->setEnabled(false);
            ui->bt_steer_input_mode_autoware->setEnabled(false);
            ui->tx_steer_input_mode->setText("");
            //ui->gb_angle->setEnabled(false);

            if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0)
            {
                ui->tx_steer_mode->setPalette(palette_steer_mode_ok_);
                ui->tx_steer_mode->setText("V0");
                ui->tx2_steer_mode->setPalette(palette_steer_mode_ok_);
                ui->tx2_steer_mode->setText("V0");
            }
            else
            {
                ui->tx_steer_mode->setPalette(palette_steer_mode_error_);
                ui->tx2_steer_mode->setPalette(palette_steer_mode_error_);
                if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_V0)
                {
                    ui->tx_steer_mode->setText("not V0");
                    ui->tx2_steer_mode->setText("not V0");
                }
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER)
                {
                    ui->tx_steer_mode->setText("not joy center");
                    ui->tx2_steer_mode->setText("not joy center");
                }
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                {
                    ui->tx_steer_mode->setText("not board res");
                    ui->tx2_steer_mode->setText("not board res");
                }
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0 + autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER)
                {
                    ui->tx_steer_mode->setText("not V0\nnot joy center");
                    ui->tx2_steer_mode->setText("not V0\nnot joy center");
                }
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0 + autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                {
                    ui->tx_steer_mode->setText("not V0\nnot board res");
                    ui->tx2_steer_mode->setText("not V0\nnot board res");
                }
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER + autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                {
                    ui->tx_steer_mode->setText("not joy cente\nnot board res");
                    ui->tx2_steer_mode->setText("not joy cente\nnot board res");
                }
                else
                {
                    ui->tx_steer_mode->setText("undefined");
                    ui->tx2_steer_mode->setText("undefined");
                }
            }
        }

        //clutch
        if(can503_.clutch == true)
        {
            ui->tx_drive_clutch->setPalette(palette_drive_clutch_connect_);
            ui->tx2_drive_clutch->setPalette(palette_drive_clutch_connect_);
            ui->tx_drive_clutch->setText("connect");
            ui->tx2_drive_clutch->setText("connect");
        }
        else
        {
            ui->tx_drive_clutch->setPalette(palette_drive_clutch_cut_);
            ui->tx2_drive_clutch->setPalette(palette_drive_clutch_cut_);
            ui->tx_drive_clutch->setText("cut");
            ui->tx2_drive_clutch->setText("cut");
        }
        if(can502_.clutch == true)
        {
            ui->tx_steer_clutch->setPalette(palette_steer_clutch_connect_);
            ui->tx2_steer_clutch->setPalette(palette_steer_clutch_connect_);
            ui->tx_steer_clutch->setText("connect");
            ui->tx2_steer_clutch->setText("connect");
        }
        else
        {
            ui->tx_steer_clutch->setPalette(palette_steer_clutch_cut_);
            ui->tx2_steer_clutch->setPalette(palette_steer_clutch_cut_);
            ui->tx_steer_clutch->setText("cut");
            ui->tx2_steer_clutch->setText("cut");
        }

        //入力モード
        if(can_status_.use_input_steer == true)
            ui->tx_steer_input_mode->setText("input");
        else
            ui->tx_steer_input_mode->setText("auto");
        if(can_status_.use_input_drive == true)
            ui->tx_drive_input_mode->setText("input");
        else
            ui->tx_drive_input_mode->setText("auto");
    }
    else
    {
        ui->tx_drive_mode->setText("");
        ui->tx2_drive_mode->setText("");
        ui->tx_drive_control_mode->setText("");
        ui->tx_drive_input_mode->setText("");
        ui->tx_steer_mode->setText("");
        ui->tx2_steer_mode->setText("");
        ui->tx_steer_input_mode->setText("");
        ui->tx_velocity_target->setText("");
        ui->tx_velocity_actual->setText("");
        ui->tx_stroke_target->setText("");
        ui->tx2_drive_stroke_target->setText("");
        ui->tx_stroke_actual->setText("");
        ui->tx2_drive_stroke_actual->setText("");
        ui->tx_angle_target->setText("");
        ui->tx2_steer_angle_target->setText("");
        ui->tx_angle_actual->setText("");
        ui->tx2_steer_angle_actual->setText("");
    }

    if(can_status_.safety_error_message != "" && error_text_lock_ == false)
    {
        std_msgs::Bool msg;
        msg.data = true;
        pub_error_lock_.publish(msg);

        ui->tx_error_text->setText(can_status_.safety_error_message.c_str());
        ui->tx2_error_text->setText(can_status_.safety_error_message.c_str());
        error_text_lock_ = true;
        system("aplay -D plughw:PCH /home/autoware/one33.wav");
    }

    if(fabs(distance_angular_check_.baselink_distance) <= config_.check_distance_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance OK," << config_.check_distance_th << "," << distance_angular_check_.baselink_distance;
        ui->tx_distance_check->setText(str.str().c_str());
        ui->tx_distance_check->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance NG," << config_.check_distance_th << "," << distance_angular_check_.baselink_distance;
        ui->tx_distance_check->setText(str.str().c_str());
        ui->tx_distance_check->setPalette(palette_distance_angular_error_);
    }

    if(fabs(distance_angular_check_ndt_.baselink_distance) <= config_.check_distance_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance OK," << config_.check_distance_th << "," << distance_angular_check_ndt_.baselink_distance;
        ui->tx_ndt_distance_check->setText(str.str().c_str());
        ui->tx_ndt_distance_check->setPalette(palette_distance_angular_ok_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ndt_.baselink_distance;
        ui->tx2_ndt_distance->setText(str2.str().c_str());
        if(localizer_select_ == 0 || localizer_select_ == 10)
            ui->tx2_ndt_distance->setPalette(palette_current_localizer_);
        else
            ui->tx2_ndt_distance->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance NG," << config_.check_distance_th << "," << distance_angular_check_ndt_.baselink_distance;
        ui->tx_ndt_distance_check->setText(str.str().c_str());
        ui->tx_ndt_distance_check->setPalette(palette_distance_angular_error_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ndt_.baselink_distance;
        ui->tx2_ndt_distance->setText(str2.str().c_str());
        ui->tx2_ndt_distance->setPalette(palette_distance_angular_error_);
    }

    if(fabs(distance_angular_check_ekf_.baselink_distance) <= config_.check_distance_th)
    {
        /*std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance OK," << config_.check_distance_th << "," << distance_angular_check_ekf_.baselink_distance;
        ui->tx_ekf_distance_check->setText(str.str().c_str());
        ui->tx_ekf_distance_check->setPalette(palette_distance_angular_ok_);*/

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ekf_.baselink_distance;
        ui->tx2_ekf_distance->setText(str2.str().c_str());
        ui->tx2_ekf_distance->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        /*std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance NG," << config_.check_distance_th << "," << distance_angular_check_ekf_.baselink_distance;
        ui->tx_ekf_distance_check->setText(str.str().c_str());
        ui->tx_ekf_distance_check->setPalette(palette_distance_angular_error_);*/

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ekf_.baselink_distance;
        ui->tx2_ekf_distance->setText(str2.str().c_str());
        ui->tx2_ekf_distance->setPalette(palette_distance_angular_error_);
    }
    
    if(fabs(distance_angular_check_gnss_.baselink_distance) <= config_.check_distance_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance OK," << config_.check_distance_th << "," << distance_angular_check_gnss_.baselink_distance;
        ui->tx_gnss_distance_check->setText(str.str().c_str());
        ui->tx_gnss_distance_check->setPalette(palette_distance_angular_ok_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_gnss_.baselink_distance;
        ui->tx2_gnss_distance->setText(str2.str().c_str());
        if(localizer_select_ == 1 || localizer_select_ == 11)
            ui->tx2_gnss_distance->setPalette(palette_current_localizer_);
        else
            ui->tx2_gnss_distance->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "distance NG," << config_.check_distance_th << "," << distance_angular_check_gnss_.baselink_distance;
        ui->tx_gnss_distance_check->setText(str.str().c_str());
        ui->tx_gnss_distance_check->setPalette(palette_distance_angular_error_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_gnss_.baselink_distance;
        ui->tx2_gnss_distance->setText(str2.str().c_str());
        ui->tx2_gnss_distance->setPalette(palette_distance_angular_error_);
    }

    {
        double dif = distance_angular_check_ndt_.baselink_distance - distance_angular_check_gnss_.baselink_distance;
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << dif;
        ui->tx2_localizer_difference->setText(str.str().c_str());
    }

    double angular_deg = distance_angular_check_.baselink_angular * 180.0 / M_PI;
    double angular_deg_ndt = distance_angular_check_ndt_.baselink_angular * 180.0 / M_PI;
    double angular_deg_ekf = distance_angular_check_ekf_.baselink_angular * 180.0 / M_PI;
    double angular_deg_gnss = distance_angular_check_gnss_.baselink_angular * 180.0 / M_PI;
    if(fabs(angular_deg) <= config_.check_angular_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular OK," << config_.check_angular_th << "," << angular_deg;
        ui->tx_angular_check->setText(str.str().c_str());
        ui->tx_angular_check->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular NG," << config_.check_angular_th << "," << angular_deg;
        ui->tx_angular_check->setText(str.str().c_str());
        ui->tx_angular_check->setPalette(palette_distance_angular_error_);
    }

    if(fabs(angular_deg_ndt) <= config_.check_angular_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular OK," << config_.check_angular_th << "," << angular_deg_ndt;
        ui->tx_ndt_angular_check->setText(str.str().c_str());
        ui->tx_ndt_angular_check->setPalette(palette_distance_angular_ok_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ndt_.baselink_angular;
        ui->tx2_ndt_angular->setText(str2.str().c_str());
        if(localizer_select_ == 0 || localizer_select_ == 10)
            ui->tx2_ndt_angular->setPalette(palette_current_localizer_);
        else
            ui->tx2_ndt_angular->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular NG," << config_.check_angular_th << "," << angular_deg_ndt;
        ui->tx_ndt_angular_check->setText(str.str().c_str());
        ui->tx_ndt_angular_check->setPalette(palette_distance_angular_error_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << angular_deg_ndt;
        ui->tx2_ndt_angular->setText(str2.str().c_str());
        ui->tx2_ndt_angular->setPalette(palette_distance_angular_error_);
    }

    if(fabs(angular_deg_ekf) <= config_.check_angular_th)
    {
        /*std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular OK," << config_.check_angular_th << "," << angular_deg_ekf;
        ui->tx_ekf_angular_check->setText(str.str().c_str());
        ui->tx_ekf_angular_check->setPalette(palette_distance_angular_ok_);*/

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << distance_angular_check_ekf_.baselink_angular;
        ui->tx2_ekf_angular->setText(str2.str().c_str());
        ui->tx2_ekf_angular->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        /*std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular NG," << config_.check_angular_th << "," << angular_deg_ekf;
        ui->tx_ekf_angular_check->setText(str.str().c_str());
        ui->tx_ekf_angular_check->setPalette(palette_distance_angular_error_);*/

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << angular_deg_ekf;
        ui->tx2_ekf_angular->setText(str2.str().c_str());
        ui->tx2_ekf_angular->setPalette(palette_distance_angular_error_);
    }

    if(fabs(angular_deg_gnss) <= config_.check_angular_th)
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular OK," << config_.check_angular_th << "," << angular_deg_gnss;
        ui->tx_gnss_angular_check->setText(str.str().c_str());
        ui->tx_gnss_angular_check->setPalette(palette_distance_angular_ok_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << angular_deg_gnss;
        ui->tx2_gnss_angular->setText(str2.str().c_str());
        if(localizer_select_ == 1 || localizer_select_ == 11)
            ui->tx2_gnss_angular->setPalette(palette_current_localizer_);
        else
            ui->tx2_gnss_angular->setPalette(palette_distance_angular_ok_);
    }
    else
    {
        std::stringstream str;
        str << std::fixed << std::setprecision(keta) << "angular NG," << config_.check_angular_th << "," << angular_deg_gnss;
        ui->tx_gnss_angular_check->setText(str.str().c_str());
        ui->tx_gnss_angular_check->setPalette(palette_distance_angular_error_);

        std::stringstream str2;
        str2 << std::fixed << std::setprecision(keta) << angular_deg_gnss;
        ui->tx2_gnss_angular->setText(str2.str().c_str());
        ui->tx2_gnss_angular->setPalette(palette_distance_angular_error_);
    }

    {
        std::stringstream str;
        switch(localizer_select_)
        {
            case 0:
                ui->tx_localizer_select->setText("NDT+ODOM");
                ui->tx_localizer_select->setPalette(palette_localizer_select_ok_);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(true);
                ui->lb2_ndt->setAutoFillBackground(false);
                break;
            case 10:
                ui->tx_localizer_select->setText("GNSS+GYLO->NDT+ODOM");
                ui->tx_localizer_select->setPalette(palette_localizer_select_ok_);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(true);
                ui->lb2_ndt->setAutoFillBackground(false);
                break;
            case 1:
                ui->tx_localizer_select->setText("GNSS+GYLO");
                ui->tx_localizer_select->setPalette(palette_localizer_select_ok_);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(true);
                break;
            case 11:
                ui->tx_localizer_select->setText("NDT+ODOM->GNSS+GYLO");
                ui->tx_localizer_select->setPalette(palette_localizer_select_ok_);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(true);
                break;
            default:
                ui->tx_localizer_select->setText("distance too large");
                ui->tx_localizer_select->setPalette(palette_localizer_select_error_);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(false);
                ui->lb2_ndt->setAutoFillBackground(false);
        }
        
    }

    {
        std::stringstream str;
        std::string stat = (localizer_match_stat_.localizer_stat == true) ? "true" : "false";
        str << stat << "," << localizer_match_stat_.localizer_distance;
        ui->tx_localizer_match_stat->setText(str.str().c_str());
    }

    {
        std::stringstream str_vel;
        str_vel << std::fixed << std::setprecision(keta) << can_velocity_param_.velocity * 3.6;
        ui->tx_can_velocity->setText(str_vel.str().c_str());
        ui->tx2_vel->setText(str_vel.str().c_str());

        std::stringstream str_acc;
        str_acc << std::fixed << std::setprecision(keta) << can_velocity_param_.acceleration;
        ui->tx_can_accel->setText(str_acc.str().c_str());
        ui->tx2_acc->setText(str_acc.str().c_str());

        std::stringstream str_jurk;
        str_jurk << std::fixed << std::setprecision(keta) << can_velocity_param_.jurk;
        ui->tx_can_jurk->setText(str_jurk.str().c_str());
        ui->tx2_jurk->setText(str_jurk.str().c_str());

        std::stringstream str_stop_dis;
        str_stop_dis  << std::fixed << std::setprecision(keta) << stopper_distance_;
        ui->tx_stopper_distance->setText(str_stop_dis.str().c_str());
        ui->tx2_stopD->setText(str_stop_dis.str().c_str());

        std::stringstream str_way_num;
        str_way_num << waypoint_param_.id;
        ui->tx_waypoint_num->setText(str_way_num.str().c_str());
    }

    {
        std::stringstream str_lat, str_lon, str_alt;
        str_lat << std::fixed << std::setprecision(keta) << gnss_deviation_.lat_std;
        if(gnss_deviation_.lat_std > config_.gnss_lat_limit)
        {
            ui->tx_lat->setPalette(palette_gnss_deviation_error_);
            ui->tx2_gnss_lat->setPalette(palette_gnss_deviation_error_);
        }
        else
        {
            ui->tx_lat->setPalette(palette_gnss_deviation_ok_);
            ui->tx2_gnss_lat->setPalette(palette_gnss_deviation_ok_);
        }
        ui->tx_lat->setText(str_lat.str().c_str());
        ui->tx2_gnss_lat->setText(str_lat.str().c_str());

        str_lon << std::fixed << std::setprecision(keta) << gnss_deviation_.lon_std;
        if(gnss_deviation_.lon_std > config_.gnss_lon_limit)
        {
            ui->tx_lon->setPalette(palette_gnss_deviation_error_);
            ui->tx2_gnss_lon->setPalette(palette_gnss_deviation_error_);
        }
        else
        {
            ui->tx_lon->setPalette(palette_gnss_deviation_ok_);
            ui->tx2_gnss_lon->setPalette(palette_gnss_deviation_ok_);
        }
        ui->tx_lon->setText(str_lon.str().c_str());
        ui->tx2_gnss_lon->setText(str_lon.str().c_str());

        str_alt << std::fixed << std::setprecision(keta) << gnss_deviation_.alt_std;
        if(gnss_deviation_.alt_std > config_.gnss_alt_limit)
        {
            ui->tx_alt->setPalette(palette_gnss_deviation_error_);
            ui->tx2_gnss_alt->setPalette(palette_gnss_deviation_error_);
        }
        else
        {
            ui->tx_alt->setPalette(palette_gnss_deviation_ok_);
            ui->tx2_gnss_alt->setPalette(palette_gnss_deviation_ok_);
        }
        ui->tx_alt->setText(str_alt.str().c_str());
        ui->tx2_gnss_alt->setText(str_alt.str().c_str());
    }

    {
        std::stringstream str_ndt_stat, str_gnss_ok, str_ndt_string;
        str_ndt_stat << std::fixed << std::setprecision(keta) << ndt_stat_.score;
        ui->tx_ndt_score->setText(str_ndt_stat.str().c_str());
        ui->tx2_ndt_score->setText(str_ndt_stat.str().c_str());
        if(gnss_stat_ == 3)
        {
            ui->tx_gnss_ok->setPalette(palette_gnss_deviation_ok_);
            ui->tx_gnss_ok->setText("OK");
            ui->tx2_gnss_ok->setPalette(palette_gnss_deviation_ok_);
            ui->tx2_gnss_ok->setText("OK");
        }
        else
        {
            ui->tx_gnss_ok->setPalette(palette_gnss_deviation_error_);
            ui->tx_gnss_ok->setText("NG");
            ui->tx2_gnss_ok->setPalette(palette_gnss_deviation_error_);
            ui->tx2_gnss_ok->setText("NG");
        }
        if(ndt_stat_string_ == "NDT_OK")
        {
            ui->tx_ndt_ok->setPalette(palette_gnss_deviation_ok_);
            ui->tx_ndt_ok->setText("OK");
            ui->tx2_ndt_ok->setPalette(palette_gnss_deviation_ok_);
            ui->tx2_ndt_ok->setText("OK");
        }
        else
        {
            ui->tx_ndt_ok->setPalette(palette_gnss_deviation_error_);
            ui->tx_ndt_ok->setText("NG");
            ui->tx2_ndt_ok->setPalette(palette_gnss_deviation_error_);
            ui->tx2_ndt_ok->setText("NG");
        }
    }

    {
        ui->tx_stroke_routine->setText(stroke_routine_.c_str());
    }

    {
        double yaw, roll, pitch;
        tf::Quaternion qua;
        tf::quaternionMsgToTF(gnss_pose_.pose.orientation, qua);
        tf::Matrix3x3 mat(qua);
        mat.getRPY(roll, pitch, yaw);

        std::stringstream str_yaw, str_roll, str_pitch;
        str_yaw << std::setprecision(keta) << yaw*180/M_PI;
        ui->tx_yaw->setText(str_yaw.str().c_str());
        ui->tx2_gnss_yaw->setText(str_yaw.str().c_str());
        str_roll << std::setprecision(keta) << roll*180/M_PI;
        ui->tx_roll->setText(str_roll.str().c_str());
        ui->tx2_gnss_roll->setText(str_roll.str().c_str());
        str_pitch << std::setprecision(keta) << pitch*180/M_PI;
        ui->tx_pitch->setText(str_pitch.str().c_str());
        ui->tx2_gnss_pitch->setText(str_pitch.str().c_str());
    }

    {
        if(mobileye_lane_.lane_type_left != mobileye_560_660_msgs::AftermarketLane::LANE_TYPE_NONE &&
           mobileye_lane_.lane_confidence_left >= 1)
        {
            std::stringstream str_left;
            str_left << std::fixed << std::setprecision(keta) << mobileye_lane_.distance_to_left_lane;
            ui->tx2_left_lane->setText(str_left.str().c_str());
        }
        else ui->tx2_left_lane->setText("NONE");

        if(mobileye_lane_.lane_type_right != mobileye_560_660_msgs::AftermarketLane::LANE_TYPE_NONE &&
           mobileye_lane_.lane_confidence_right >= 1)
        {
            std::stringstream str_right;
            str_right << std::fixed << std::setprecision(keta) << mobileye_lane_.distance_to_right_lane;
            ui->tx2_right_lane->setText(str_right.str().c_str());
        }
        else ui->tx2_right_lane->setText("NONE");
    }
}

void MainWindow::callbackConfig(const autoware_config_msgs::ConfigMicroBusCan &msg)
{
    config_ = msg;
}

void MainWindow::callbackLocalizerSelect(const std_msgs::Int32 &msg)
{
    localizer_select_ = msg.data;
}

void MainWindow::callbackLocalizerMatchStat(const autoware_msgs::LocalizerMatchStat &msg)
{
    localizer_match_stat_ = msg;
}

void MainWindow::callbackCan501(const autoware_can_msgs::MicroBusCan501 &msg)
{
    can501_ = msg;
}

void MainWindow::callbackCan502(const autoware_can_msgs::MicroBusCan502 &msg)
{
    if(ui->cb_use_clutch->isChecked() == true && msg.clutch == true && error_text_lock_ == true)
        click_error_text_reset();
    can502_ = msg;
}

void MainWindow::callbackCan503(const autoware_can_msgs::MicroBusCan503 &msg)
{
    if(ui->cb_use_clutch->isChecked() == true && msg.clutch == true && error_text_lock_ == true)
        click_error_text_reset();
    can503_ = msg;
}

void MainWindow::callbackCanStatus(const autoware_can_msgs::MicroBusCanSenderStatus &msg)
{
    can_status_ = msg;
}

void MainWindow::callbackDistanceAngularCheck(const autoware_msgs::DifferenceToWaypointDistance &msg)
{
    distance_angular_check_ = msg;
}

void MainWindow::callbackDistanceAngularCheckNdt(const autoware_msgs::DifferenceToWaypointDistance &msg)
{
    distance_angular_check_ndt_ = msg;
}

void MainWindow::callbackDistanceAngularCheckEkf(const autoware_msgs::DifferenceToWaypointDistance &msg)
{
    distance_angular_check_ekf_ = msg;
}

void MainWindow::callbackDistanceAngularCheckGnss(const autoware_msgs::DifferenceToWaypointDistance &msg)
{
    distance_angular_check_gnss_ = msg;
}

void MainWindow::callbackImu(const sensor_msgs::Imu & msg)
{
    imu_ = msg;
}

void MainWindow::callbackCanVelocityParam(const autoware_can_msgs::MicroBusCanVelocityParam &msg)
{
    can_velocity_param_ = msg;
}

void MainWindow::callbackStopperDistance(const std_msgs::Float64 &msg)
{
    stopper_distance_ = msg.data;
}

void MainWindow::callbackWaypointParam(const autoware_msgs::WaypointParam &msg)
{
    waypoint_param_ = msg;
}

void MainWindow::callbackNdtStat(const autoware_msgs::NDTStat &msg)
{
    ndt_stat_ = msg;
}

void MainWindow::callbackGnssPose(const geometry_msgs::PoseStamped &msg)
{
    gnss_pose_ = msg;
}

void MainWindow::callbackGnssDeviation(const autoware_msgs::GnssStandardDeviation &msg)
{
    gnss_deviation_ = msg;
}

void MainWindow::callbackGnssStat(const std_msgs::UInt8 &msg)
{
    gnss_stat_ = msg.data;
}

void MainWindow::callbackNdtStatString(const std_msgs::String &msg)
{
    ndt_stat_string_ = msg.data;
}

void MainWindow::callbackStrokeRoutine(const std_msgs::String &msg)
{
    stroke_routine_ = msg.data;
}

const bool getMessage_bool(const unsigned char *buf, unsigned int bit)
{
    unsigned long long mask=1;
    mask<<=bit;
    unsigned long long *msgL=(unsigned long long)buf;
    if((*msgL & mask)) return true;
    else return false;
}

template<typename T>
const T getMessage_bit(const unsigned char *buf, const unsigned int lowBit, const unsigned int highBit)
{
    const unsigned int maxBitSize=sizeof(unsigned long long)*8;
    unsigned long long *msgL=(unsigned long long)buf;
    unsigned long long val=(*msgL)<<maxBitSize-highBit-1;
    unsigned int lowPos=lowBit+(maxBitSize-highBit-1);
    val>>=lowPos;
    return (T)val;
}

void MainWindow::callbackMobileyeCan(const can_msgs::Frame &frame)
{
    switch(frame.id)
    {
    case 0x669:
        {
            if(frame.is_error == false && frame.dlc == 8)
            {
                const unsigned char *buf = (unsigned char*)frame.data.data();
                //Lane type
                mobileye_lane_.lane_type_left = getMessage_bit<unsigned char>(&buf[0], 4, 7);
                mobileye_lane_.lane_type_right = getMessage_bit<unsigned char>(&buf[5], 4, 7);
                //ldw_available
                mobileye_lane_.ldw_available_left = getMessage_bool(&buf[0], 2);
                mobileye_lane_.ldw_available_right = getMessage_bool(&buf[5], 2);
                //lane_confidence
                mobileye_lane_.lane_confidence_left = getMessage_bit<unsigned char>(&buf[0], 0, 1);
                mobileye_lane_.lane_confidence_right = getMessage_bit<unsigned char>(&buf[5], 0, 1);
                //distance_to lane
                int16_t distL, distR;
                unsigned char* distL_p = (unsigned char*)&distL;
                distL_p[1] = getMessage_bit<unsigned char>(&buf[2], 4, 7);
                distL_p[0] = getMessage_bit<unsigned char>(&buf[2], 0, 3) << 4;
                distL_p[0] |= getMessage_bit<unsigned char>(&buf[1], 4, 7);
                if(distL_p[1] & 0x8)//12bitのマイナスか
                {
                    distL--;
                    distL = ~distL;
                    distL_p[1] &= 0x0F;
                    distL = -distL;
                }
                mobileye_lane_.distance_to_left_lane = distL * 0.02;
                std::cout << "distL : " << (int)distL << std::endl;
                unsigned char* distR_p = (unsigned char*)&distR;
                distR_p[1] = getMessage_bit<unsigned char>(&buf[7], 4, 7);
                distR_p[0] = getMessage_bit<unsigned char>(&buf[7], 0, 3) << 4;
                distR_p[0] |= getMessage_bit<unsigned char>(&buf[6], 4, 7);
                if(distR_p[1] & 0x8)//12bitのマイナスか
                {
                    distR--;
                    distR = ~distR;
                    distR_p[1] &= 0x0F;
                    distR = -distR;
                }
                mobileye_lane_.distance_to_right_lane = distR * 0.02;
                std::cout << "distR : " << (int)distR << std::endl;
            }
            break;
        }
    }
}

void MainWindow::publish_emergency_clear()
{
    std_msgs::Empty msg;
    pub_unlock_.publish(msg);
}

void MainWindow::publish_Dmode_manual()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_drive_mode_.publish(msg);
}

void MainWindow::publish_Dmode_program()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_drive_mode_.publish(msg);
}

void MainWindow::publish_Dmode_velocity()
{
    std_msgs::Int8 msg;
    msg.data = autoware_can_msgs::MicroBusCan501::DRIVE_MODE_VELOCITY;
    pub_drive_control_.publish(msg);
}

void MainWindow::publish_Dmode_stroke()
{
    std_msgs::Int8 msg;
    msg.data = autoware_can_msgs::MicroBusCan501::DRIVE_MODE_STROKE;
    pub_drive_control_.publish(msg);
}

void MainWindow::publish_Dmode_input_direct()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_drive_input_.publish(msg);
}

void MainWindow::publish_Dmode_input_auto()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_drive_input_.publish(msg);
}

void MainWindow::publish_Smode_manual()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_steer_mode_.publish(msg);
}

void MainWindow::publish_Smode_program()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_steer_mode_.publish(msg);
}

void MainWindow::publish_Smode_input_direct()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_steer_input_.publish(msg);
}

void MainWindow::publish_Smode_input_auto()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_steer_input_.publish(msg);
}

void MainWindow::publish_drive_clutch_connect()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_drive_clutch_.publish(msg);
}

void MainWindow::publish_drive_clutch_cut()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_drive_clutch_.publish(msg);
}

void MainWindow::publish_steer_clutch_connect()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_steer_clutch_.publish(msg);
}

void MainWindow::publish_steer_clutch_cut()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_steer_clutch_.publish(msg);
}

void MainWindow::publish_blinker_right()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_blinker_right_.publish(msg);
}

void MainWindow::publish_blinker_left()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_blinker_left_.publish(msg);
}

void MainWindow::publish_blinker_stop()
{
    std_msgs::Bool msg;
    msg.data = true;
    pub_blinker_stop_.publish(msg);
}

void MainWindow::publish_use_safety_localizer()
{
    std_msgs::Bool msg;
    msg.data = ui->cb_use_localizer_safety->isChecked();
    pub_use_safety_localizer_.publish(msg);
}

void MainWindow::click_error_text_reset()
{
    std_msgs::Bool msg;
    msg.data = false;
    pub_error_lock_.publish(msg);

    error_text_lock_ = false;
    ui->tx_error_text->setText("");
    ui->tx2_error_text->setText("");
}
