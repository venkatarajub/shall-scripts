#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Run the script with root previlages"
fi
dnf install nginx -y