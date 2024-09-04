#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    echo  "exit status : $1"
}

if [ $USERID -ne 0 ]
then 
    echo "Run the script with root privilages"
    exit 1
fi
dnf list installed nginx
VALIDATE $?