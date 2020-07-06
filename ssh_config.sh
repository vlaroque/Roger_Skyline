apt install openssh-server
if grep -q "Port 2222" /etc/ssh/sshd_config
then
	echo "ssh_config already completed"
else
	# Change default port to 2222
	sed -i "s/#Port 22/Port 2222/" /etc/ssh/sshd_config
	# Disable Root connextions
	echo "PermitRootLogin no" >> /etc/ssh/sshd_config
	# Disable password connections. Only by public keys connection is available
	echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
	mkdir -p /home/user42/.ssh
	cp id_rsa_deby.pub /home/user42/.ssh/
	touch /home/user42/.ssh/autorized_keys
	cat /home/user42/.ssh/id_rsa_deby.pub >> /home/user42/.ssh/autorized_keys
fi
service ssh restart