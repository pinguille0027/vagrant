#!/bin/sh
apt install isc-dhcp-server -y
cat /vagrant/dhcpd > /etc/dhcp/dhcpd.conf
cat /vagrant/default-isc-server > /etc/default/isc-dhcp-server