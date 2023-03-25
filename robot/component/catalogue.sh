#!/bin/bash
set -e

COMPONENT==catalogue

source robot/component/common.sh

echo -n "Configuring NodeJS Repo : "
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install nodejs -y 
stat $?

echo -n "Configuring Application User $APPUSER"
useradd $APPUSER
stat $?


