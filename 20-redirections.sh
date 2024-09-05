#!/bin/bash
#write script to install multiple packages and redirect the logs to specific dir
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Run the script with root privilages $N"
        exit 1
    fi 
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is ... FAILED"
        exit 1
    else
        echo "$2 is ... SUCCESS"
    fi
}

CHECK_ROOT

#if you  need to  install multiple  packages we need to write loop

for $package in $@
do
dnf list installed $package
if [ $? -ne 0 ]
then
    echo "$package not installed. going to install..."
    dnf install $package -y
    VALIDATE $? Installed $package
else
    echo "$package already installed. Nothing to do..."
fi
done
