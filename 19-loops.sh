#!/bin/bash
#write a script to install  multiplepackages
USERID=$(id -u)
R="\e[31m"
G="\e[35m"

CHECK_ROOT(){
        if [ $USERID -ne 0 ]
    then
        echo  "Run the script  with root privillages"
        exit 1
    fi   
}

VALIDATE(){
    if [ $1 -ne 0  ]
    then
        echo -e "$2 is ..  $R FAILED $N"
        exit 1
    else 
        echo -e "$2 is .. $G SUCCESS $N"
    fi
}

CHECK_ROOT

for package in $@
do
    dnf list installed $package
    if [ $? -ne  0 ]
    then 
        echo "$package not installed. Installing $package"
        dnf install $package -y
        VALIDATE $? "Intalled $package"
    else
        echo -e "$G $package already installed. Nothing to do $N"
    fi
done