#!/bin/bash

if md5sum -c /root/crontab_control_sum
then
	echo 'Crontab [ok]'
else
	diff /root/crontab_original /var/spool/crontab/root > /root/crontab_log
	mpack -s 'Crontab has been modified!' /root/crontab_log root@roger
fi
