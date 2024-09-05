#!/bin/bash
#write script to install multiple packages and redirect the logs to specific dir
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"

mkdir -p $LOGS_FOLDER

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Run the script with root privilages $N" &>>$LOG_FILE
        exit 1
    fi 
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is ... FAILED" &>>$LOG_FILE
        exit 1
    else
        echo "$2 is ... SUCCESS" &>>$LOG_FILE
    fi
}
USAGE(){
    echo "UASGE :: sudo sh 20-redirections.sh package1 package2 package3.."
    exit 1
}

echo "Script started executed at : $(date)"
CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package not installed. going to  install" &>>$LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? installed $package &>>$LOG_FILE
    else
        echo "$package already installed nothing  to do" &>>$LOG_FILE
    fi
done