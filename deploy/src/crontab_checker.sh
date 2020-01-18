#!/bin/bash

DIFF=$(diff /root/crontab_original /etc/crontab)

if ["$DIFF" != ""]
then
mail -s "Crontab WARNING!" root <<< "Warning! Crontab hacked!"
fi
