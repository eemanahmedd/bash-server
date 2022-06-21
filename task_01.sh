#!/bin/bash

# This script installs nginx if it is not installed, and update nginx if it is already installed.

ROOT_UID=0
E_NOTROOT=100

read -rp "Install or Upgrade NGINX (y/n)" INSTALL

if [[ $INSTALL =~ ^([yY][eE][sS]|[yY]$ ]]; then
	
	if [ "$UID" -ne "$ROOT_UID" ]
	then
		echo "Must be root user to run this script."
		exit $E_NOTROOT
	
	fi

		which nginx &> /dev/null || {
			echo "Installing ngingx"
			apt install update -y
			apt install upgrade -y
			apt intall nginx
		echo;
		echo "COngratulations on the installation onf NGINX!"

			} && {
				echo "Updating NGINX Server"
				apt install update -y
				apt install upgrade -y
				apy install nginx --upgrade
			}

			echo "Completed bhae."

fi
