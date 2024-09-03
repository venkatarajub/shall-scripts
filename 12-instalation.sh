#!/bin/bash
#Install  mysql
#id -u "To  get the user id, root user having 0"

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ] #to check the given package installed  or not 0 mean installed
then 
    echo "mysql is  not istalled, installing mysql.."
else
    echo "mysql already installed. Nothing to  do.."
fi