#!/bin/sh
apt install bind9 -y
echo "named.conf"
cat /vagrant/named.conf.options > /etc/bind/named.conf.options
echo "conf.local"
echo 'zone "gofasir.com" {
    type master;
    file "/etc/bind/gofasir.com";
};' > /etc/bind/named.conf.local
echo "zona"
cat /vagrant/zona > /etc/bind/gofasir.com
systemctl restart bind9
nslookup www.gofasir.com
