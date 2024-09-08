#!/bin/bash
SOURCE_DIR="/home/ec2-user"

if [ -d $SOURCE_DIR -eq 0 ]
then
    echo "directory exists"
else
    echo "directory  not exist"
    exit 1
fi


find /home/ec2-user -name "*.log" -mtime +14
 


