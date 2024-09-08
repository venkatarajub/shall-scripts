#!/bin/bash
SOURCE_DIR="/home/ec2-user"

if [ -d $SOURCE_DIR -ne 0 ]
then
    echo "directory not exists"
    exit 1
else
    echo "directory exists"
fi


find /home/ec2-user -name "*.log" -mtime +14



