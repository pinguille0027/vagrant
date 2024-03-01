#!/bin/sh
if ip r | grep default | grep 10.0.2.2 >/dev/null; then
	echo "Cambiando a porta de enlace"
	ip r del default via 10.0.2.2 dev eth0
	ip r add default via 192.168.1.101 dev eth1
fi


