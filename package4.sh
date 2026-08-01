#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell-script"
mkdir -p $LOG_FOLDER
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "you are not in root user environment.." | tee -a $LOG_FILE
    exit 1
fi

validate(){
    if [ $1 -ne 0 ];then
        echo "$2 failure..."  | tee -a $LOG_FILE
    else 
        echo "$2 success.."  | tee -a $LOG_FILE
    fi
}

dnf remove nginx -y &>> $LOG_FILE
validate $? "removing nginx "

dnf remove mysql -y &>> $LOG_FILE
validate $? "removing mysql"

dnf remove nodejs -y &>> $LOG_FILE
validate $? "removing nodejs"