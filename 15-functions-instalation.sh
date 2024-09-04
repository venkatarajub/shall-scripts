#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "command is ...FAILED"
        exit 1
    else 
        echo "commad is ...SUCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Run the script with root privilages"
    exit 1
fi
dnf list installed nginx
VALIDATE $?