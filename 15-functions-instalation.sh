#!/bin/bash
USERID=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo  "$2 is .. FAILED"
        exit 1
    else 
        echo "$2 is .. SUCCESS"
    fi
}
if [ $USERID -ne 0 ]
then
    echo "Run the script with root previlages"
    exit 1
fi
dnf list installed nginx
VALIDATE $? "Listing nginx"
# if [ $? -ne 0 ]
# then
#     echo "nginx not installed. going to install..."
#     dnf install nginx -y
#     if [ $? -ne 0 ]
#     then
#         echo "nginx instalation failed. Please check"
#         exit 1
#     else
#         echo  "nginx instalsation successfully completed."
#     fi  
# else 
#     echo "nginx already installed nothing to do.."
# fi
