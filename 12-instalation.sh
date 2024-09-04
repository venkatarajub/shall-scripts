#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Plrase run the script  with  root privilages"
    exit 1

fi
dnf install git -y