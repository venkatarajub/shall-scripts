#!/bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #14day is defult if user didn't pass any arg it will concider as 14days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$Y USAGE :: 25-backup.sh <source> <destination> <days (optional)> $N"

}

if [ $# -lt 2 ]
then
    USAGE
fi

#check given DIR exists or not

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
else
    echo "$SOURCE_DIR not exists.. Please check"
    exit 1
fi

if [ -d $DEST_DIR ]
then 
    echo  "$DEST_DIR exists"
else
    echo "$DEST_DIR not exists. please check"
fi
