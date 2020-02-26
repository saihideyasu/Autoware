#include <ros/ros.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <nmea_msgs/Sentence.h>
#include <string>

namespace {
    ros::Publisher nmea_pub;
}

void publish(const char buf[], const int bufSize)
{
 	std::string str(buf);
    nmea_msgs::Sentence sentence;
    sentence.header.stamp=ros::Time::now();
    sentence.header.frame_id="gps";
    sentence.sentence=str;
    nmea_pub.publish(sentence);
}

int main(int argc, char** argv)
{
    ros::init(argc,argv,"nmea_tcp");
    ros::NodeHandle nh, private_nh("~");

    std::string ip_str;
    private_nh.getParam("ip", ip_str);
    std::cout << ip_str << std::endl;
    int sock = socket(PF_INET, SOCK_STREAM, 0);//ソケットの作成

    //接続先指定用構造体の準備
    struct sockaddr_in server;
    server.sin_family = PF_INET;
    server.sin_port = htons(3001);
    server.sin_addr.s_addr = inet_addr(ip_str.c_str());

    //サーバに接続
    connect(sock, (struct sockaddr *)&server, sizeof(server));

    nmea_pub=nh.advertise<nmea_msgs::Sentence>("nmea_sentence",1);

    //ros::Rate rate(1);
    while(ros::ok())
    {
        char buf[300];
        int len=read(sock, buf, sizeof(buf));
        if(len <= 0) continue;
        buf[len]='\0';
        publish(buf,len);
        //std::cout << "size : " << len << std::endl;
        printf("%s\n\n",buf);
        //rate.sleep();
    }

    close(sock);
    return 0;
}
