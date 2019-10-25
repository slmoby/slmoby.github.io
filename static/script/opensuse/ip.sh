#!/bin/bash
cat > /etc/sysconfig/network/ifcfg-eth0 << EOF
BOOTPROTO='static'
BROADCAST=''
ETHTOOL_OPTIONS=''
IPADDR='10.0.0.$1/24'
MTU=''
NAME=''
NETMASK='255.255.255.0'
NETWORK=''
REMOTE_IPADDR=''
STARTMODE='auto'
EOF

cat > /etc/sysconfig/network/ifcfg-eth1 << EOF
BOOTPROTO='static'
BROADCAST=''
ETHTOOL_OPTIONS=''
IPADDR='192.168.100.$1/24'
MTU=''
NAME=''
NETMASK='255.255.255.0'
NETWORK=''
REMOTE_IPADDR=''
STARTMODE='auto'
DHCLIENT_SET_DEFAULT_ROUTE='yes'
EOF

echo "setting gateway!"
echo 'default 192.168.100.1' > /etc/sysconfig/network/routes
sed -i "s/NETCONFIG_DNS_STATIC_SERVERS=\"\"/NETCONFIG_DNS_STATIC_SERVERS=\"192.168.100.1\"/g" /etc/sysconfig/network/config
