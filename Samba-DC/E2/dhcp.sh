#!/bin/sh
apt update
apt install isc-dhcp-server -y
cp /vagrant/isc-dhcp-server /etc/default
cp /vagrant/dhcpd.conf /etc/dhcp
systemctl enable isc-dhcp-server
systemctl start isc-dhcp-server
