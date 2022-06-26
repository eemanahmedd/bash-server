#!/bin/bash

#rm /var/www/html/*
#mv $PWD/index.html /var/www/html

nstatus=$(systemctl status nginx | grep Active | awk '{print $2}')
nversion=$(nginx -v 2>&1 | awk -F' ' '{print $3}' | cut -d / -f 2)
aversion=$(aws --version | awk '{print $1}' | tr '/' '-')
sgnum=$(aws ec2 describe-security-groups --query "SecurityGroups[*].{Name:GroupName}"  --output text | wc -l)
ecnum=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId]' --region us-east-1 --output text | wc -l)
sed -i "s/NGINXSTATUS/$nstatus/g" /var/www/html/index.html
sed -i "s/NGINXVERSION/$nversion/g" /var/www/html/index.html
sed -i "s/VERSIONAWS/$aversion/g" /var/www/html/index.html
sed -i "s/EC2COUNT/$ecnum/g" /var/www/html/index.html
sed -i "s/SECGRPCOUNT/$sgnum/g" /var/www/html/index.html
