#!/bin/bash


echo "installing nginx :"
yum install nginx -y    &>> /tmp/frontend.log
systemctl enable nginx  &>> /tmp/frontend.log
systemctl start nginx   &>> /tmp/frontend.log
if [ $? -eq 0 ]; then
    echo "Success"
else 
    echo "Failure"
fi         

echo "starting Nginx :"
systemctl start nginx &>> /tmp/frontend.log 
if [ $? -eq 0 ]; then
    echo "Success"
else 
    echo "Failure"
fi 