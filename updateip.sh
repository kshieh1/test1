#!/bin/bash

IPADDRESS=$(curl -s http://ipv4.icanhazip.com/)

echo "Last check at: $(date)" >> updateip.log

if [[ "${IPADDRESS}" != $(cat ~/updateip/current_ip) ]];then
#if echo "${IPADDRESS}" | mutt -s "new ip" myemail@com ;then
#echo "Ip change from $(cat ~/updateip/current_ip) to ${IPADDRESS}" >> updateip.log
echo ${IPADDRESS} > ~/updateip/current_ip

git add -u
git commit -m "Automatic save commit initiated at $(date)"
#git push
#else
#echo "Failed to send the mail, try again later." >> updateip.log
#fi
fi
