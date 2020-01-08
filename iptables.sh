#!/bin/bash
#author:qinliang
#note:iptables input ip
#og office ip 106.38.76.146/32,164.52.50.78/32
#og zabbix_hk_proxy 103.72.147.246/32
#og proxy_bj 101.251.236.14
iptables -F
iptables -X
iptables -Z
iptables -F -t nat
iptables -X -t nat
iptables -Z -t nat
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s 106.38.76.146/32 -j ACCEPT
iptables -A INPUT -s 164.52.50.78/32 -j ACCEPT
iptables -A INPUT -s 103.72.147.246/32 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
