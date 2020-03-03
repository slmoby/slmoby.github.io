#!/bin/bash
cat >/etc/netplan/50-cloud-init.yaml<<EOF
# This file describes the network interfaces available on your system
# For more information, see netplan(5).
network:
  version: 2
  renderer: networkd
  ethernets:
    enp1s0:
     dhcp4: no
     addresses: [10.0.0.$1/24]
    enp2s0:
     dhcp4: no
     addresses: [192.168.100.$1/24]
     gateway4: 192.168.100.1
     nameservers:
       addresses: [192.168.100.1,8.8.8.8]
EOF
