#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
echo "INSTALANDO UFW"
apt update
apt install ufw -y

echo "CONFIGURANDO UFW"

ufw default allow incoming
ufw default allow outgoing
ufw allow ssh

# enrutar
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo sysctl -p

# conf reglas enrrutamineto
cat <<EOL | sudo tee -a /etc/ufw/before.rules
# NAT table rules
*nat
:POSTROUTING ACCEPT [0:0]

# Allow traffic from internal network to external network
-A POSTROUTING -s 172.16.1.0/24 -o eth1 -j MASQUERADE

# End NAT table rules
COMMIT
EOL

# reiniciar servicio
sudo ufw disable
sudo ufw enable 
