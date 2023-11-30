#!/bin/sh
apt install isc-dhcp-server -y
cat /vagrant/dhcp/dhcpd > /etc/dhcp/dhcpd.conf
cat /vagrant/dhcp/default-isc-server > /etc/default/isc-dhcp-server