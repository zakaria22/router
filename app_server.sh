bash <<EOF2
sed -i 's/ubuntu/appserver/g' /etc/hostname
sed -i 's/ubuntu/appserver/g' /etc/hosts
hostname appserver
cat >> /etc/network/interfaces << EOF 
auto enp0s8
iface enp0s8 inet static
   address 192.168.3.1
   netmask 255.255.255.0
up route add -net 192.168.0.0/16 gw 192.168.3.254 dev enp0s8
EOF
/etc/init.d/networking restart
exit
EOF2
