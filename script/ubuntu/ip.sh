#!/bin/bash
cat > /etc/network/interfaces << EOF
source /etc/network/interfaces.d/*
# The loopback network interface
auto lo
iface lo inet loopback
# The primary network interface
auto ens3
iface ens3 inet static
        address 10.0.0.$1
	netmask 255.255.255.0
auto ens4
iface ens4 inet static
        address 192.168.100.$1
	netmask 255.255.255.0
	gateway 192.168.100.1
	dns-nameservers 192.168.100.1
EOF

