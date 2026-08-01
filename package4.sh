#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell-script"
mkdir -p $LOG_FOLDER
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "you are not in root user environment.."
    exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
        echo "$2 failure..."
    else 
        echo "$2 success.."
}

dnf install nginx -y
validate $? "installing nginx "

dnf install mysql -y
validate $? "installing mysql"

dnf install nodejs -y
validate $? "installing nodejs"