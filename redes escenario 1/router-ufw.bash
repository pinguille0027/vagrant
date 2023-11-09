apt update
apt install ufw -y
ufw allow 2222
cat /etc/default/ufw | grep 'DEFAULT_FORWARD_POLICY="ACCEPT"' || echo 'DEFAULT_FORWARD_POLICY="ACCEPT"' | tee -a /etc/default/ufw
sed -i '/^#net\/ipv4\/ip_forward=1/s/^#//' /etc/ufw/sysctl.conf
sed -i '/^#net\/ipv6\/conf\/default\/forwarding=1/s/^#//' /etc/ufw/sysctl.conf
sed -i '/^#net\/ipv6\/conf\/all\/forwarding=1/s/^#//' /etc/ufw/sysctl.conf

cat /etc/ufw/before.rules | grep '# NAT table rules' || sed -i '/-A ufw-before-input -p udp -d 239.255.255.250 --dport 1900 -j ACCEPT/a\# NAT table rules\
*nat\
:POSTROUTING ACCEPT [0:0]\
\
# Forward traffic through eth0 - Change to match you out-interface\
-A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE' /etc/ufw/before.rules
systemctl restart ufw