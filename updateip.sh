#!/bin/bash

IPADDRESS=$(curl -s http://ipv4.icanhazip.com/)

echo "Last check at: $(date)" >> updateip.log

if [[ "${IPADDRESS}" != $(cat ~/updateip/current_ip) ]];then

echo "Ip change from $(cat ~/updateip/current_ip) to ${IPADDRESS}" >> updateip.log
echo ${IPADDRESS} > ~/updateip/current_ip

git add -u
git commit -m "Automatic save commit initiated at $(date)"
git push

fi
