#! /bin/bash
cp -R scripts /home/user42/
chmod +x /home/user42/scripts/update.sh
chmod +x /home/user42/scripts/crontabMonitor.sh
echo "0 4	* * 1	root	/home/user42/scripts/update.sh" >> /etc/crontab
echo "@reboot		root	/home/user42/scripts/update.sh" >> /etc/crontab
echo "0 0	* * *	root	/home/user42/scripts/crontabMonitor.sh" >> /etc/crontab
echo "change crontab"