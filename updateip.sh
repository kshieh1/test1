#!/bin/bash

# required for using this script in crontab
cd /home/pi/updateip

IPADDRESS=$(curl -s http://ipv4.icanhazip.com/)

echo "Last check at: $(date)" >> updateip.log

if [[ "${IPADDRESS}" != $(cat current_ip) ]];then

echo "Ip change from $(cat current_ip) to ${IPADDRESS}" >> updateip.log
echo ${IPADDRESS} > current_ip

git add -u
git commit -m "Automatic save commit initiated at $(date)"
git push

fi
