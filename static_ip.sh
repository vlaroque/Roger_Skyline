sed -i "s/allow-hotplug enp0s3/auto enp0s3/" /etc/network/interfaces
sed -i "s/iface enp0s3 inet dhcp/iface enp0s3 inet static/" /etc/network/interfaces
# inet 10.0.2.15/24 brd 10.0.2.255 gateway = 10.0.2.2
if grep -q "10.0.2.3/30" /etc/network/interfaces
then
echo "\taddress 10.0.2.3/30" >> /etc/network/interfaces
echo "\tgateway 10.0.2.2" >> /etc/network/interfaces
fi
systemctl restart networking
echo finish