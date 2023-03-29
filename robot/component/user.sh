#!/bin/bash

COMPONENT=user
source component/common.sh

echo -n "Configuring NodeJS Repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> "${LOGFILE}"
stat $?

eho -n "Installing nodeJS : "
yum install nodejs -y &>> "${LOGFILE}"
stat $?



id $APPUSER &>> "${LOGFILE}"
if [ $? -ne 0 ]; then
    echo -n "Creating Application User $APPUSER : "
    useradd $APPUSER &>> "${LOGFILE}"
    stat $?
fi

echo -n "Downloading the $COMPONENT"
curl -s -L -o /tmp/catalogue.zip "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?

echo -n "Cleanup and Extracting $COMPONENT : "
rm -rf /home/$APPUSER/$COMPONENT/
cd /home/$APPUSER
unzip -o /tmp/$COMPONENT.zip &>> "${LOGFILE}"
stat $?


echo -n "Changing the ownership to $APPUSER "
mv /home/$APPUSER/$COMPONENT-main /home/$APPUSER/$COMPONENT
chown -R $APPUSER:$APPUSER /home/$APPUSER/$COMPONENT
stat $?

echo -n "Installing $COMPONENT Dependencies : "
cd $COMPONENT
npm install &>> "${LOGFILE}"
stat $?

echo -n "Configuring the $COMPONENT Service : "
sed -i -e 's/REDIS_ENDPOINT/redis.roboshop.internal/' -e 's/MONGO_ENDPOINT/mongo.roboshop.internal/' /home/$APPUSER/$COMPONENT/systemed.service
mv /home/$APPUSER/$COMPONENT/systemed.service /etc/systemd/system/$COMPONENT.service
stat $?


echo -n "Starting $COMPONENT Service : "
systemctl daemon-reload &>> "${LOGFILE}"
systemctl enable $COMPONENT &>> "${LOGFILE}"
systemctl start $COMPONENT &>> "${LOGFILE}"
systemctl status $COMPONENT &>> "${LOGFILE}"
stat $?
