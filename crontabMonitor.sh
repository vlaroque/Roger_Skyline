#! /bin/bash
car /var/log/syslog | grep crontab | grep RELOAD > new_crontab_change
if diff last_crontab_change new_crontab_change then
echo lol
else
echo elze
fi 
cp new_crontab_change last_crontab_change