#!/bin/bash

lsb_dist="$(. /etc/os-release && echo "$ID")"
dist_version="$(. /etc/os-release && echo "$VERSION_ID")"
if [ "$lsb_dist" =  "centos" ]
 then
    yum install epel-release
	yum install fail2ban
	systemctl enable fail2ban
	echo "[DEFAULT]" >> "/etc/fail2ban/jail.local"
	echo "bantime = 21600" >> "/etc/fail2ban/jail.local"
	echo "banaction = iptables-multiport" >> "/etc/fail2ban/jail.local"
	echo "[sshd]" >> "/etc/fail2ban/jail.local"
	echo "enabled = true" >> "/etc/fail2ban/jail.local"
	systemctl restart fail2ban
	echo "yep yep done"
	
else
    echo "You aren't using CentOS rn fam this won't work"
fi