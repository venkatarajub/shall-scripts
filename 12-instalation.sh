#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Plrase run the script  with  root privilages"
    exit 1

fi
dnf  list installed git
if [ $? -ne 0 ]
then
    echo "git is  not installed going to install"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git instalation not success. pleae check"
        exit 1
    else 
        echo "git instalation sucess"
    fi     
else
    echo "git already installed. nothing to do.."
fi