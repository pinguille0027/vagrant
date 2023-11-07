#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade
apt install apt-cacher-ng -y
echo "PassThroughPattern : .*
VfileUseRangeOps: -1" >> /etc/apt-cacher-ng/acng.conf
echo "AdminAuth:guille:renaido" > /etc/apt-cacher-ng/security.conf
systemctl restart apt-cacher-ng
echo "cacher instalado"