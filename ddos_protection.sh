#! /bin/bash
apt install fail2ban
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
cat ressources/add_f2b >> /etc/fail2ban/jail.local
cp ressources/apache-dos.conf /etc/fail2ban/filter.d/
service fail2ban restart
