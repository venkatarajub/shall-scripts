#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Plrase run the script  with  root privilages"

fi
dnf install git -y