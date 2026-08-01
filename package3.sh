#!/bin/bash
userid=$(id -u)
Log_Folder="/var/log/shell-script"
Log_File="/var/log/shell-script/$0.log"
mkdir -p $Log_Folder

if [ $userid -ne 0 ]; then
    echo "you are not in root user environment please enter root environment..." | tee -a $Log_File
    exit 1
fi


validate (){
if [ $1 -ne 0 ]; then
    echo "$2 failed.." | tee -a $Log_File
else
    echo "$2 succes." | tee -a $Log_File
fi

}
dnf remove nginx -y &>> $Log_File
validate $? "removing  nginx ..."

dnf remove mysql -y &>> $Log_File
validate $? "removing mysql"

dnf remove nodejs -y &>> $Log_File
validate $? "removing nodejs"