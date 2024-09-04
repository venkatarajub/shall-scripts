#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Run the script with root previlages"
    exit 1
fi
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx not installed. going to install..."
    if [ $? -ne 0 ]
    then
        echo "nginx instalation failed. Please check"
        exit 1
    elase
        echo  "nginx instalsation successfully completed."
    fi  
elase 
    echo "nginx already installed nothing to do.."
