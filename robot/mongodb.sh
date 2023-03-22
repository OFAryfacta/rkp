#!/bin/bash


COMPONENT=mongodb
LOGFILE=/tmp/$COMPONENT.log


stat(){
    if [ $1 -eq 0 ]; then
       echo -e "\e[32m Success \e[0m"
    else 
       echo -e "\e[32m Failure \e[0m"
fi          
}

echo -n "Downloading $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "Installing $COMPONENT : "
yum install -y mongodb-org  &>> $LOGFILE

echo -n "Starting $COMPONENT : "
systemctl enable mongod
systemctl start mongod
stat $?

echo -n "downloading the $COMPONENT schema :"
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
stat $?

echo -n "extracting the $COMPONENT schema files : "
cd /tmp
unzip -o mongodb.zip &>> $LOGFILE
stat $?

echo -n "Injecting the schema : "
cd mongodb-main
mongo < catalogue.js &>>$LOGFILE
mongo < user.js      &>>$LOGFILE
stat $?


