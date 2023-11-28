#!/bin/sh
apt install bind9 -y
echo "named.conf"
cat /vagrant/named.conf.options > /etc/bind/named.conf.options
echo "conf.local"
cat /vagrant/named.conf.local > /etc/bind/named.conf.local
echo "zona"
cat /vagrant/zona > /etc/bind/gofasir.com
cat /vagrant/zonatienda1 > /etc/bind/tienda1.com
systemctl restart bind9
nslookup www.gofasir.com
