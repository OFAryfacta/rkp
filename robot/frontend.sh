#!/bin/bash

echo "I am Frontend"

yum install nginx -y > /tmp/frontend.log
systemct1 enable nginx
systemct1 start nginx  