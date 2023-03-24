#!/bin/bash
set -e

COMPONENT==catalogue
LOGFILE=/tmp/$COMPONENT.log
APPUSER=roboshop

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

echo -n "Configuring Application User $APPUSER"
useradd $APPUSER
stat $?
