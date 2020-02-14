#!/bin/bash
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
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 443,80,8081 -j ACCEPT
iptables -A INPUT -s 164.52.50.78/32 -j ACCEPT
iptables -A INPUT -s 101.251.236.14/32 -j ACCEPT
iptables -A INPUT -s 103.72.147.246/32 -j ACCEPT
iptables -A INPUT -s 52.28.90.155/32 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
