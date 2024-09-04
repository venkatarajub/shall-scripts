#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne0 ]
then
    echo "Plrase run the script  with  root privilages"

fi
dnf install git -y