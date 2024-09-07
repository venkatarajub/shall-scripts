#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOG_FLODER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%s)
LOG_FILE=$LOG_FLODER/$SCRIPT_NAME-$TIMESTAMP.log

mkdir -p $LOG_FLODER

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$Y Run the script with root privilages $N" | tee -a $LOG_FILE
        exit 1
    fi 
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is ... $R FAILED $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2 is ... $G  SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    if [ $# -eq  0 ]
    then 
        echo -e "$Y  USAGE :: sudo sh 22-redirection-practice.sh package1 package2 package3 ... $N" | tee -a $LOG_FILE
        exit 1
    fi
}

echo -e "$Y Script start running on $(date) $N" | tee -a $LOG_FILE

CHECK_ROOT

USAGE

for package in $@
do
    dnf  list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$B $package not installed.. going to install $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "instaled $package" | tee -a $LOG_FILE
    else
        echo -e "$package already installed. $G nothing to do $N"
    fi
done
