#!/bin/bash

COMPONENT=redis

source component/common.sh

echo -n "Configuring the $COMPONENT repo : "
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repo.d/redis.repo
stat $?

echo -n "Installing $COMPONENT : "
yum install redis-6.2.7 -y &>> "${LOGFILE}"
stat $?

echo -n "Whitelisting the $COMPONENT : "
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
stat $?

echo -n "Starting $COMPONENT : "
systemctl enable $COMPONENT
systemctl start $COMPONENT
stat $?
