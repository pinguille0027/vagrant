#!/bin/sh
if ip r | grep default | grep "10.0.2.2" >/dev/null; then
	echo "Cambiando a porta de enlace"
	ip r del default via 10.0.2.2 dev enp0s3
	ip r add default via 172.16.2.1 dev enp0s8
fi