apt install -y --force-yes portsentry
sed -i "s/BLOCK_UDP="0"/BLOCK_UDP="1"/" /etc/portsentry/portsentry.conf
sed -i "s/BLOCK_TDP="0"/BLOCK_TCP="1"/" /etc/portsentry/portsentry.conf
sed -i "s/TCP_MODE="tcp"/TCP_MODE="atcp"/" /etc/default/portsentry
sed -i "s/TCP_MODE="udp"/TCP_MODE="audp"/" /etc/default/portsentry
service portsentry restart