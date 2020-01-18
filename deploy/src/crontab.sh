#!/bin/bash
echo "@reboot bash /etc/cron.d/update_script.sh" >> /var/spool/cron/crontabs/root
echo "0 4 * * 0 bash /etc/cron.d/update_script.sh" >> /var/spool/cron/crontabs/root
echo "0 0 * * * bash /etc/cron.d/crontab_checker.sh" >> /var/spool/cron/crontabs/root
echo "@reboot bash /etc/cron.d/port_scan_protect.sh" >> /var/spool/cron/crontabs/root
