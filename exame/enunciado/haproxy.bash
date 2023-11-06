#!/bin/bash
echo "actualizando"
apt update

echo "instalando haproxy"
apt install haproxy -y

systemctl enable haproxy

cp /vagrant/enunciado/haproxy.cfg /etc/haproxy/

systemctl restart haproxy

