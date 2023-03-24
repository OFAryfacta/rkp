#!/bin/bash
set -e

COMPONENT=mongodb
LOGFILE=/tmp/$COMPONENT.log

ID=$(id -u)
if [ $ID -ne 0 ] ; then
    echo -e "\e[31m You need to script either as a root user or with a sudo privilege \e[0m"
    exit 1
fi

stat() {
    if [ $1 -eq 0 ]; then
        echo -e "\e[32m Success \e[0m"
    else
        echo -e "\e[31m Failure \e[0m"
    fi        
}

echo -n "Download ing $COMPONENT : "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?

echo -n "Installing $COMPONENT : "
yum install -y mongodb-org &>> $LOGFILE

