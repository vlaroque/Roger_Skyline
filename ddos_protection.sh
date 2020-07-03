apt install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
cat add_f2b >> /etc/fail2ban/jail.local
cp apache-dos.conf /etc/fail2ban/filter.d/
service fail2ban restart
