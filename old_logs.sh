#!/bin/bash

LOGS_DIR="/home/ec2-user/app-logs"
LOG_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo "logs dir not exist"
    exit 1
fi

FILES_TO_DELETE=$(find "$LOGS_DIR" -name "*.log" -type f )

while IFS= read -r filepath;
do
    echo "deleting file : $(basename "$filepath")"
    sleep 1
    rm -rf $filepath
    echo "deleted file: $(basename "$filepath")"
done <<< $FILES_TO_DELETE
