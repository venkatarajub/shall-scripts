#!/bin/bash
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

USAGE(){

   echo -e "$Y USAGE :: sudo sh 21-redirections-tee.sh package1 package2 package3 ... $N" 
   exit 1
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 is ... $G SUCCESS $N"
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed. going to install... $N"
        dnf install $package -y
        VALIDATE $? $package installed
    else
        echo -e "$G  $package already installed. nothing to do $N"
    fi
done