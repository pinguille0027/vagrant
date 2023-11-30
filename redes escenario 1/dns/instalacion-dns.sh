#!/bin/sh
apt install bind9 -y
echo "named.conf"
cat /vagrant/dns/named.conf.options > /etc/bind/named.conf.options
echo "conf.local"
cat /vagrant/dns/named.conf.local > /etc/bind/named.conf.local
echo "zona"
cat /vagrant/dns/zona > /etc/bind/gofasir.com
cat /vagrant/dns/zonatienda1 > /etc/bind/tienda1.com
systemctl restart bind9
nslookup www.gofasir.com
