#!/bin/bash
#author:qinliang
#date:1.8.2020
systemctl stop firewalld.service
systemctl disable firewalld.service
yum install epel-release -y
yum -y install iptables-services net-tools
systemctl enable iptables.service
yum -y install wget
yum -y install vim
mkdir /script
cd /script
wget https://raw.githubusercontent.com/learning2016/initialization-os/master/iptables.sh
sh /script/iptables.sh
systemctl stop firewalld.service
systemctl disable firewalld.service
setenforce 0
sed -i 's/enforcing/disabled/g' /etc/selinux/config
getenforce
iptables -L -n
chmod +x /etc/rc.d/rc.local
chmod +x /etc/rc.local
systemctl start rc-local.service
systemctl status rc-local.service
