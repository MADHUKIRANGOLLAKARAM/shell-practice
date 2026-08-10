#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
    echo "please enetr as root user"
    exit 1
fi

usage(){
    echo "<source><destination><days>"

}

if [ $# -lt 2 ]; then
    usage
fi