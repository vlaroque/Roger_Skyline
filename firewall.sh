apt install ufw
ufw allow 80 #http
ufw allow 443 #https
ufw limit 2222 #SSH limit 6 or more connections
ufw enable
