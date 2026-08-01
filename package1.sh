#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "you are not in root user environment please enter root environment..."
    exit 1
fi

echo "installing ..."
dnf install nginx -y

if [ $! -ne 0 ]; then
    echo "install failed.."
else
    echo "install succes."
fi
