#!/bin/bash

echo "I am Frontend"

yum install nginx -y    &>> /tmp/frontend.log
systemct1 enable nginx  &>> /tmp/frontend.log
systemct1 start nginx   &>> /tmp/frontend.log