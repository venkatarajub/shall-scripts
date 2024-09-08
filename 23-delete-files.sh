#!/bin/bash
SOURCE_DIR="/home/ec2-user/log" #DIR in which files need to check

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR exists"
    
else
    echo "$SOURCE_DIR not exists"
    exit 
fi

FILES=$(find /home/ec2-user -name "*.log" -mtime +14)

echo "14days older files are $FILES"

while IFS= read -r line 
#while conditions used to read the out put or line,  IFS is "Internal Field Separator" empty it will ignore while space. -r is for not to ingore special charecters.

do
    echo "Deleteing line : $line"
    rm  -rf $line

done <<<$FILES


