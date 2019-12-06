#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(ros::NodeHandle nh, ros::NodeHandle p_nh, QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    palette_drive_mode_ok_ = ui->tx_drive_mode->palette();
    palette_steer_mode_ok_ = ui->tx_steer_mode->palette();
    palette_position_check_ok_ = ui->tx_position_check->palette();
    palette_angle_limit_over_ok_ = ui->tx_angle_limit_over->palette();
    palette_drive_clutch_connect_ = ui->tx_drive_clutch->palette();
    palette_steer_clutch_connect_ = ui->tx_steer_clutch->palette();
    palette_drive_mode_error_ = palette_drive_mode_ok_;
    palette_steer_mode_error_ = palette_steer_mode_ok_;
    palette_position_check_error_ = palette_position_check_ok_;
    palette_angle_limit_over_ok_ = palette_angle_limit_over_ok_;
    palette_drive_clutch_cut_ = palette_drive_clutch_connect_;
    palette_steer_clutch_cut_ = palette_steer_clutch_connect_;
    palette_drive_mode_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_steer_mode_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_position_check_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_angle_limit_over_error_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_drive_clutch_cut_.setColor(QPalette::Base, QColor("#FF0000"));
    palette_steer_clutch_cut_.setColor(QPalette::Base, QColor("#FF0000"));

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

    nh_ = nh;  private_nh_ = p_nh;

    pub_unlock_ = nh_.advertise<std_msgs::Empty>("/microbus/emergency_reset", 1);
    pub_drive_mode_ = nh_.advertise<std_msgs::Bool>("/microbus/drive_mode_send", 1);
    pub_drive_control_ = nh_.advertise<std_msgs::Int8>("/microbus/drive_control", 1);
    pub_steer_mode_ = nh_.advertise<std_msgs::Bool>("/microbus/steer_mode_send", 1);
    pub_drive_input_ = nh_.advertise<std_msgs::Bool>("/microbus/input_drive_flag", 1);
    pub_steer_input_ = nh_.advertise<std_msgs::Bool>("/microbus/input_steer_flag", 1);
    pub_drive_clutch_ = nh_.advertise<std_msgs::Bool>("/microbus/drive_clutch", 1);
    pub_steer_clutch_ = nh_.advertise<std_msgs::Bool>("/microbus/steer_clutch", 1);

    sub_can501_ = nh_.subscribe("/microbus/can_receive501", 10, &MainWindow::callbackCan501, this);
    sub_can502_ = nh_.subscribe("/microbus/can_receive502", 10, &MainWindow::callbackCan502, this);
    sub_can503_ = nh_.subscribe("/microbus/can_receive503", 10, &MainWindow::callbackCan503, this);
    sub_can_status_ = nh_.subscribe("/microbus/can_sender_status", 10, &MainWindow::callbackCanStatus, this);

    can_status_.angle_limit_over = can_status_.position_check_stop = true;
    error_text_lock_ = false;
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::window_updata()
{
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
        if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_AUTO)
        {
            ui->tx_drive_mode->setPalette(palette_drive_mode_ok_);
            ui->tx_drive_mode->setText("auto");
            ui->bt_drive_control_mode_velocity->setEnabled(true);
            ui->bt_drive_control_mode_stroke->setEnabled(true);
            ui->bt_drive_input_mode_direct->setEnabled(true);
            ui->bt_drive_input_mode_autoware->setEnabled(true);

            if(can501_.drive_mode == autoware_can_msgs::MicroBusCan501::DRIVE_MODE_VELOCITY)
            {
                ui->gb_velocity->setEnabled(true);
                ui->gb_stroke->setEnabled(false);
                ui->tx_drive_control_mode->setText("velocity");
            }
            else if(can501_.drive_mode == autoware_can_msgs::MicroBusCan501::DRIVE_MODE_STROKE)
            {
                ui->gb_velocity->setEnabled(false);
                ui->gb_stroke->setEnabled(true);
                ui->tx_drive_control_mode->setText("stroke");

                std::stringstream str_target;
                str_target << can501_.velocity;
                ui->tx_stroke_target->setText(str_target.str().c_str());

                double stroke = PEDAL_VOLTAGE_CENTER_ - can503_.pedal_voltage;
                std::stringstream str_actual;
                str_actual << stroke;
                ui->tx_stroke_actual->setText(str_actual.str().c_str());
            }
            else
            {
                ui->gb_velocity->setEnabled(false);
                ui->gb_stroke->setEnabled(false);
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
            ui->gb_velocity->setEnabled(false);
            ui->gb_stroke->setEnabled(false);

            if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0)
            {
                ui->tx_drive_mode->setPalette(palette_drive_mode_ok_);
                ui->tx_drive_mode->setText("V0");
            }
            else
            {
                ui->tx_drive_mode->setPalette(palette_drive_mode_error_);
                if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_V0)
                    ui->tx_drive_mode->setText("not V0");
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER)
                    ui->tx_drive_mode->setText("not joy center");
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                    ui->tx_drive_mode->setText("not board res");
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0 + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER)
                    ui->tx_drive_mode->setText("not V0\nnot joy center");
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_V0 + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                    ui->tx_drive_mode->setText("not V0\nnot board res");
                else if(can501_.drive_auto == autoware_can_msgs::MicroBusCan501::DRIVE_NOT_JOY_CENTER + autoware_can_msgs::MicroBusCan501::DRIVE_NOT_BOARD_RES)
                    ui->tx_drive_mode->setText("not joy cente\nnot board res");
                else
                    ui->tx_drive_mode->setText("undefined");
            }
        }


        //steerモードの状態
        if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_AUTO)
        {
            ui->tx_steer_mode->setPalette(palette_steer_mode_ok_);
            ui->tx_steer_mode->setText("auto");
            ui->bt_steer_input_mode_direct->setEnabled(true);
            ui->bt_steer_input_mode_autoware->setEnabled(true);
            ui->gb_angle->setEnabled(true);

            std::stringstream str_target;
            str_target << can501_.steering_angle;
            ui->tx_angle_target->setText(str_target.str().c_str());

            std::stringstream str_actual;
            str_actual << can502_.angle_actual;
            ui->tx_angle_actual->setText(str_actual.str().c_str());
        }
        else
        {
            ui->bt_steer_input_mode_direct->setEnabled(false);
            ui->bt_steer_input_mode_autoware->setEnabled(false);
            ui->tx_steer_input_mode->setText("");
            ui->gb_angle->setEnabled(false);

            if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0)
            {
                ui->tx_steer_mode->setPalette(palette_steer_mode_ok_);
                ui->tx_steer_mode->setText("V0");
            }
            else
            {
                ui->tx_steer_mode->setPalette(palette_steer_mode_error_);
                if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_V0)
                    ui->tx_steer_mode->setText("not V0");
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER)
                    ui->tx_steer_mode->setText("not joy center");
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                    ui->tx_steer_mode->setText("not board res");
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0 + autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER)
                    ui->tx_steer_mode->setText("not V0\nnot joy center");
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_V0 + autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                    ui->tx_steer_mode->setText("not V0\nnot board res");
                else if(can501_.steer_auto == autoware_can_msgs::MicroBusCan501::STEER_NOT_JOY_CENTER + autoware_can_msgs::MicroBusCan501::STEER_NOT_BOARD_RES)
                    ui->tx_steer_mode->setText("not joy cente\nnot board res");
                else
                    ui->tx_steer_mode->setText("undefined");
            }
        }

        //position check
        if(can_status_.position_check_stop == false)
        {
            ui->tx_position_check->setPalette(palette_position_check_ok_);
            ui->tx_position_check->setText("OK");
        }
        else
        {
            ui->tx_position_check->setPalette(palette_position_check_error_);
            ui->tx_position_check->setText("ERROR");
        }

        //angle_limit_over
        if(can_status_.angle_limit_over == false)
        {
            ui->tx_angle_limit_over->setPalette(palette_angle_limit_over_ok_);
            ui->tx_angle_limit_over->setText("OK");
        }
        else
        {
            ui->tx_angle_limit_over->setPalette(palette_angle_limit_over_error_);
            ui->tx_angle_limit_over->setText("ERROR");
        }

        //clutch
        if(can503_.clutch == true)
        {
            ui->tx_drive_clutch->setPalette(palette_drive_clutch_connect_);
            ui->tx_drive_clutch->setText("connect");
        }
        else
        {
            ui->tx_drive_clutch->setPalette(palette_drive_clutch_cut_);
            ui->tx_drive_clutch->setText("cut");
        }
        if(can502_.clutch == true)
        {
            ui->tx_steer_clutch->setPalette(palette_steer_clutch_connect_);
            ui->tx_steer_clutch->setText("connect");
        }
        else
        {
            ui->tx_steer_clutch->setPalette(palette_steer_clutch_cut_);
            ui->tx_steer_clutch->setText("cut");
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
        ui->tx_drive_control_mode->setText("");
        ui->tx_drive_input_mode->setText("");
        ui->tx_steer_mode->setText("");
        ui->tx_steer_input_mode->setText("");
        ui->tx_velocity_target->setText("");
        ui->tx_velocity_actual->setText("");
        ui->tx_stroke_target->setText("");
        ui->tx_stroke_actual->setText("");
        ui->tx_angle_target->setText("");
        ui->tx_angle_actual->setText("");
        ui->tx_position_check->setText("");
    }

    if(can_status_.safety_error_message != "" && error_text_lock_ == false)
    {
        ui->tx_error_text->setText(can_status_.safety_error_message.c_str());
        error_text_lock_ = true;
    }
}

void MainWindow::callbackCan501(const autoware_can_msgs::MicroBusCan501 &msg)
{
    can501_ = msg;
}

void MainWindow::callbackCan502(const autoware_can_msgs::MicroBusCan502 &msg)
{
    can502_ = msg;
}

void MainWindow::callbackCan503(const autoware_can_msgs::MicroBusCan503 &msg)
{
    can503_ = msg;
}

void MainWindow::callbackCanStatus(const autoware_can_msgs::MicroBusCanSenderStatus &msg)
{
    can_status_ = msg;
}

void MainWindow::publish_emergency_clear()
{
    //std::cout << "aaa" << std::endl;
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

void MainWindow::click_error_text_reset()
{
    error_text_lock_ = false;
    ui->tx_error_text->setText("");
}
