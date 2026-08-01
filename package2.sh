#!/bin/bash
userid=$(id -u)
Log_Folder="/var/log/shell-script"
Log_File="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
    echo "you are not in root user environment please enter root environment..."
    exit 1
fi

mkdir -p $Log_Folder

validate (){
if [ $1 -ne 0 ]; then
    echo "$2 failed.."
else
    echo "$2 succes."
fi

}
dnf install nginx -y &>> Log_File
validate $? "installing nginx ..."

dnf install mysql -y &>> Log_File
validate $? "installing cc"

dnf install nodejs -y &>> Log_File
validate $? "installing nodejs"