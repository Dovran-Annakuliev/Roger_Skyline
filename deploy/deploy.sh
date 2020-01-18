#!/bin/bash

#check updates for system
apt-get update -y
apt-get update -y

#install usefull packages
apt-get install sudo md5sum postfix mpack vim portsentry ufw fail2ban apache2 mailutils -y

#config sudoers
cp /root/deploy/src/sudoers /etc/

#config static ip
cp /root/deploy/src/interfaces /etc/network/interfaces
ifup enp0s8

#config ssh
cp /root/deploy/src/sshd_config /etc/ssh/sshd_config

#config apache and web deployment
 openssl   req   -x509   -nodes   -days   365   -newkey   rsa:2048   -keyout   /etc/ssl/private/a\
pache-selfsigned.key   -out /etc/ssl/certs/apache-selfsigned.crt  -subj "/C=RU/ST=Moscow/L=Moscow\
/O=21/OU=school/CN=192.168.56.2"
cp /root/deploy/src/ssl-params.conf /etc/apache2/
cp /root/deploy/src/default-ssl.conf /etc/apache2/sites-available/
cp /root/deploy/src/000-default.conf /etc/apache2/sites-available/
a2enmod ssl
a2enmod headers
a2ensite default-ssl
a2enconf ssl-params
cp -r /root/deploy/site/* /var/www/html/

#config firewall
ufw enable
ufw allow 55555/tcp
ufw allow 80/tcp
ufw allow 443/tcp

#config fail2ban
cp /root/deploy/src/jail.conf /etc/fail2ban/

#config portsentry
cp /root/deploy/src/portsentry /etc/default/
cp /root/deploy/src/portsentry.conf /etc/portsentry/

#config crontab
cp /root/deploy/src/update_script.sh /etc/cron.d/
cp /root/deploy/src/crontab_checker.sh /etc/cron.d/
cp /root/deploy/src/crontab /etc/
cp /root/deploy/src/crontab	/root/crontab_original
md5sum /etc/crontab > /root/crontab_control_sum

#config aliases
cp /root/deploy/src/aliases /etc/

#stop unusefull services
#service console-setup.service stop
#service keyboard-setup.service stop
systemctl disable console-setup.service
systemctl disable keyboard-setup.service
reboot
