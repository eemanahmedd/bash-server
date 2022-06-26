#!/bin/bash

rm /var/www/html/*
mv index.html /var/www/html

nginxstatus=$(systemctl status nginx | grep Active | awk '{print $2}')
  echo $nginxstatus
sed -i "s/NGINXSTATUS/$nginxstatus/g" /var/www/html/index.html
