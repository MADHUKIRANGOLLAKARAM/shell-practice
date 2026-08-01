#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "you are not in root environment please enter root environment"
    exit 1
fi

echo "installing mysql"
dnf install mysql -y

if [ $! -ne 0 ]; then
    echo "installing mysql is failure..."
else
    echo "installing mysql is success..."
fi