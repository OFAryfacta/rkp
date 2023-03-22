#!/bin/bash

set -e ""

COMPONENT=frontend

stat() {
    if [ $1 -eq 0 ]; then
    echo -e "\e[32m Success \e[0m"
else 
    echo -e "\e[31m Failure \e[0m"
fi 
}

echo -e  "\e[32m ____________$COMPONENT Configuration Starting ___________\3[0m"

echo -n "installing nginx :"
yum install nginx -y    &>> /tmp/frontend.log
stat $?

echo -n "Starting Nginx :"
systemctl enable nginx  &>> /tmp/frontend.log
systemctl start nginx   &>> /tmp/frontend.log
stat $?

echo -n "Downloading the $COMPONENT :"
curl -s -L -o /tmp/$COMPONENT.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?
        

echo -n " clearing the default content : "
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
stat $?

echo -n "Extracting $COMPONENT : "
unzip /tmp/$COMPONENT.zip &>> /tmp/frontend.log
stat $?

echo -n "Copying $COMPONENT : "
mv frontend-main/* .  &>> /tmp/frontend.log
mv static/* .         &>> /tmp/frontend.log
rm -rf frontend-main README.md  &>> /tmp/frontend.log 
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> /tmp/frontend.log
stat $?

echo -n "Restarting Nginx : "
systemctl enable nginx   &>> /tmp/frontend.log
systemctl restart nginx  &>> /tmp/frontend.log
stat $?


echo -e  "\e[32m ____________$COMPONENT Configuration Completed ___________\3[0m"