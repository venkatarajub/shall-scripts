#!/bin/bash
USERID=$(id -u)
R="\e[36m"
G="\e[35m"
Y="\e[33"
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
then
    echo "Run the script with root previlages"
    exit 1
fi 
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e  "$2 is ..$R FAILED $N"
        exit 1
    else 
        echo -e "$2 is .. $G SUCCESS $N"
    fi
}

CHECK_ROOT
for package in $@
do
    echo $package
done