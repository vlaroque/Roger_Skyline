apt install openssh-server
echo "Port 22" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "PasswordAuthentification no" >> /etc/ssh/sshd_config
cp id_rsa.pub /home/user42/.ssh/
touch /home/user42/.ssh/autorized_keys
cat /home/user42/.ssh/id_rsa.pub >> /home/user42/.ssh/autorized_keys
service ssh restart
