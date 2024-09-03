#!/bin/bash
#Install  mysql
#id -u "To  get the user id, root user having 0"

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf install git -y