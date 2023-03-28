#!/bin/bash

COMPONENT=catalogue

source component/common.sh

echo -n "Configuring NodeJS Repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> "${LOGFILE}"
yum install nodejs -y &>> "${LOGFILE}"
stat $?

id $APPUSER &>> "${LOGFILE}"
if [ $? -ne 0 ]; then
    echo -n "Creating Application User $APPUSER : "
    useradd $APPUSER &>> "${LOGFILE}"
    stat $?
fi

echo -n "Downloading the $COMPONENT"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/catalogue/archive/main.zip"
stat $?

echo -n "Extracting the $COMPONENT : "
cd /home/$APPUSER
unzip -o /tmp/$COMPONENT.zip &>> "${LOGFILE}"

echo -n "changing the ownership to $APPUSER "
mv /home/$APPUSER/$COMPONENT-main /home/$APPUSER/$COMPONENT
chown $APPUSER:$APPUSER /home/$APPUSER/$COMPONENT
stat $?
