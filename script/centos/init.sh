#!/bin/bash
# init script
echo "disbale firewalld now"
systemctl stop firewalld.service
systemctl disable firewalld.service
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
nmcli connection modify Wired\ connection\ 1 ipv4.method manual ipv4.addresses 172.16.69.$1/24 ipv4.gateway 172.16.69.2 ipv4.dns 114.114.114.114 connection.autoconnect yes
echo "mission completed!"
