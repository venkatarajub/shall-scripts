#!/bin/bash
USERID=$(id -u)
R="\e[36m"
G="\e[35m"
Y="\e[33"
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e  "$2 is ..$R FAILED $N"
        exit 1
    else 
        echo -e "$2 is .. $G SUCCESS $N"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Run the script with root previlages"
    exit 1
fi
dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "nginx not installed. going to install..."
    dnf install nginx -y
    VALIDATE $? "Installing nginx"  
else 
    echo -e $Y "nginx already installed nothing to do.." $N
fi