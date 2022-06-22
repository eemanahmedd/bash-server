#!/bin/bash

# This script activates Nginx if it is not activated, or displays error otherwise

ROOT_UID=0
E_NOTROOT=100

if [[ "$UID" -eq "$ROOT_UID" ]]
then 
	which nginx > /dev/null || {
	echo -e "\033[0;31m Something went wrong. Nginx cannot be activated \033[0m "
	exit $E_NOTROOT
} && {
	status=$(systemctl status nginx | grep Active | awk '{print $2}')
	if [[ $status = "inactive" ]]
	then
	echo -e  "\033[0;31m NGINX is Dead. Do you want to run NGINX [y/n]? \033[0m "
		read ACTIVATE
		

		if [[ $ACTIVATE =~ ^([Yy][Ee][Ss]|[Yy])$ ]];
		then
			systemctl start nginx
			systemctl enable nginx
			echo "NGINX is now activated"
		else
		echo -e "\033[0;31m Something went wrong. NGINX cannot be activated \033[0m"
		fi
	else 
		echo -e "\033[0;32m Nginx server is running \033[0m"
	fi

}
else
	echo "Script can't be run without a sudoer"
fi
