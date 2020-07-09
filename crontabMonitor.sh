#! /bin/bash
cat /var/log/syslog | grep crontab | grep RELOAD > new_crontab_change
touch last_crontab_change new_crontab_change
if diff last_crontab_change new_crontab_change ;then
	#same
	echo lol
else
	#difft
	echo new_crontab_change
	echo elze
fi 
cp new_crontab_change last_crontab_change