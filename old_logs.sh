#!/bin/bash

LOGS_DIR="/app-logs"
LOG_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
    echo "logs dir not exist"
    exit 1
fi

FILES_TO_DELETE=$(find "$LOGS_DIR" -name "*.log" -type f -mtime +10)

echo "$FILES_TO_DELETE"