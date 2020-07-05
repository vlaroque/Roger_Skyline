apt install openssh-server
#echo "Port 2222" >> /etc/ssh/sshd_config
sed -i "s/#Port 22/Port 2222/" /etc/network/interfaces
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "PasswordAuthentification no" >> /etc/ssh/sshd_config
cp id_rsa_deby.pub /home/user42/.ssh/
touch /home/user42/.ssh/autorized_keys
cat /home/user42/.ssh/id_rsa_deby.pub >> /home/user42/.ssh/autorized_keys
service ssh restart
