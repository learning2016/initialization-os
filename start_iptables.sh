#!/bin/bash
#author:qinliang
#date:1.14.2020
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install iptables-services net-tools
systemctl start iptables.service
systemctl enable iptables.service
chmod +x /script/iptables.sh
chmod +x /etc/rc.d/rc.local
echo "/script/iptables.sh" >> /etc/rc.d/rc.local
sh /script/iptables.sh
setenforce 0
sed -i 's/enforcing/disabled/g' /etc/selinux/config
getenforce
iptables -L -n
