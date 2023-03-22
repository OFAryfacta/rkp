#!/bin/bash

cCOMPONENT=frontend

stat() {
    if [ $1 -eq 0 ]; then
    echo "Success"
else 
    echo "Failure"
fi 
}

echo -n "installing nginx :"
yum install nginx -y    &>> /tmp/frontend.log
stat $?

echo -n "Starting Nginx :"
systemctl enable nginx  &>> /tmp/frontend.log
systemctl start nginx   &>> /tmp/frontend.log
stat $?

echo -n "Downloading the $COMPONENT "
curl -s -l -o /tmp/$COMPONENT.ZIP "https://github.com/stans-robot-project/$COMPONENT/archive/main.zip"
stat $?
        

