#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is ...FAILED"
        exit 1
    else 
        echo "$2 is ...SUCESS"
    fi
}

if [ $USERID -ne 0 ]
then 
    echo "Run the script with root privilages"
    exit 1
fi
dnf list installed git
VALIDATE $? "listing git"
