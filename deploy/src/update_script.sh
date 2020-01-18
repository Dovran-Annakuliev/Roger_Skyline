#!/bin/bash

date >> /var/log/update_script.log
apt update -y >> /var/log/update_script.log
apt upgrade -y >> /var/log/update_script.log
