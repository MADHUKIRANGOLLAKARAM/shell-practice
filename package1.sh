#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "you are not in root user environment please enter root environment..."
    exit 1
fi

validate (){
if [ $1 -ne 0 ]; then
    echo "$2 failed.."
else
    echo "$2 succes."
fi

}
dnf install nginx -y
validate $? "installing nginx ..."

dnf install mysql -y
validate $? "installing mysql"

dnf install nodejs -y
validate $? "installing nodejs -y"


