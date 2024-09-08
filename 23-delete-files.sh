#!/bin/bash
SOURCE_DIR="/home/ec2-user"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
    
else
    echo "$SOURCE_DIR not exists"
    exit 
fi


find /home/ec2-user -name "*.log" -mtime +14



