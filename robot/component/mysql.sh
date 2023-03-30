#!/bin/bash

COMPONENT=mysql

source components/common.sh

echo -n "Configuring the $COMPONENT repo : "
curl -s -L -o /etc/yum.repo.d/$COMPONENT.repo https://raw.githubusercontent.com/stans-robot-project/$COMPONENT/main/$COMPONENT.repo &>> "${LOGFILE}"
stat $?

echo -n "Installing $COMPONENT : "
yum install mysql-community-server -y &>> "${LOGFILE}"
stat $?

echo -n "Starting $COMPONENT : "
systemctl enable mysqld
systemctl start mysqld
stat $?

