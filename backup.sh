#!/bin/bash

USER_ID=$(id -u)

if [ USER_ID -ne 0 ]; then
    echo "please enetr as rrot user"
    exit 1
fi

usage(){
    echo "<source><destination><days>"

}
usage