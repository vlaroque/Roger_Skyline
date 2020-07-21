#! /bin/zsh
cur_sha=$(sha512sum /etc/crontab)
touch last_sha
diff last_sha <(echo -e "$cur_sha") > /dev/null
if [$? -eq 0]; then
	#same
else
	#difft
	echo "WARNING Crontab has been changed in the last 24 hours" | mail -S "WARNING Crontab changed" root@${HOST}
	echo -e "$cur_sha" > last_sha
fi