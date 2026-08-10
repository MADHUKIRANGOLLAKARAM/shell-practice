#!/bin/bash
USER_ID=$(id -u)
SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-10}
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="$LOG_FOLDER/$(basename $0).log"

if [ $USER_ID -ne 0 ]; then
    echo "you are not in root environment..."
    exit 1
fi

usage(){
    echo "source-dir destination-dir days"
    
}

if [ $# -lt 2 ]; then
    usage
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "source directory is not exist : $SOURCE_DIR"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo "destination directory is not exist : $DESTINATION_DIR"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +10)


while IFS= read -r filepath;
do
    echo "deleting a file : $filepath"
    echo "deleted file: $filepath "

done <<< $FILES_TO_DELETE
