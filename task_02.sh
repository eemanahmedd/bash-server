#!/bin/bash

# This script activates Nginx if it is not activated, or displays error otherwise

ROOT_UID=0
E_NOTROOT=100

if [ "$UID" -ne "$ROOT_UID" ]
then 
	echo "Must have root privilege to run this script."
	exit $E_NOTROOT
fi
	systemctl -q is-active nginx || {
		echo  -e "\033[0;32m NGINX is running \033[0m"
	} && {
		read -ro -e "\033[0;31m NGINX is Dead. Do you want to run NGINX [y/n]?" RUN
		
		}

		if [[ $RUN =~ ^([Yy][Ee][Ss]|[Yy])$ ]];
		then
			systemctl start nginx
			systemctl enable nginx
			echo "NGINX is now activated"
		
fi
	echo -e "\033[0;31m Something went wrong. NGINX can not be activated"
