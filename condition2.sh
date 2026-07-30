#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "you are not in root user environment.."
    exit 1
fi

echo "installing nginx..."
dnf install nginx -y

if [ $! -ne o ]; then
    echo "installing nginx is failed..."
else
    echo "installing nginx is successfully...."
fi