#!/bin/bash
SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=$(3:-14)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE :: 24-backup.sh <source> <destinaion> <days (Optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
    exit
fi

#check the source and destination dir exists or not

if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR not exits ..  please  check"
fi

if [ ! -d $DESTINATION_DIR ]
then 
    echo "$DESTINATION_DIR not exits ..  please  check"
fi