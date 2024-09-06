#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


CHECK_ROOT(){
    
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Run the script with root privilages $N" | tee -a $LOG_FILE
        exit 1
    fi
}

USAGE(){

   echo -e "$Y USAGE :: sudo sh 21-redirections-tee.sh package1 package2 package3 ... $N" | tee -a $LOG_FILE 
   exit 1
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is ... $R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is ... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

CHECK_ROOT

if  [ $# -eq 0 ]
then 
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed. going to install... $N" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? $package installed |  tee -a $LOG_FILE
    else
        echo -e "$G  $package already installed. nothing to do $N" | tee -a $LOG_FILE
    fi
done