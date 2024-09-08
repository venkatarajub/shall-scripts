#!/bin/bash
SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}
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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)

echo  "Files : $FILES"

if [ ! -z $FILES ]
then 
    echo "Files are are found"
    ZIP_FILE=$DESTINATION_DIR/app-logs-$TIMESTAMP.zip
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip $ZIP_FILE
    #check zip file created or not using if condition
    if [ -f $ZIP_FILE ]
    then 
        echo "Successfully Zipped files older than $DAYS"
        
        #remove the files  from source  dir
        while IFS= read -r file
        do
            echo "Deleting file : $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failed"
        exit 1
    fi
else
    echo "echo "No files older than $DAYS"
fi



