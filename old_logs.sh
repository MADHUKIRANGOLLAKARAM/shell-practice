#!/bin/bash

LOGS_DIR="/home/ec2-user/app-logs"
LOG_FILE="$LOGS_DIR/$0.log"

if [ ! $LOGS_DIR ]; then
    echo "logs dir not exist"
    exit1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -type f -mtime +10)

echo "$FILES_TO_DELETE"