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

log(){
    echo -e "$(date "+%f:%H:%M:%S" ) | S1 "
}

if [ -z "$FILES_TO_DELETE" ]; then
    log "no files to archive"
else 
    log "files found to archive"
    ZIP_FILE_NAME="$DESTINATION_DIR/$(basename $0).tar.gz"
    log "zip file name is : $ZIP_FILE_NAME"
    tar -zcvf "$ZIP_FILE_NAME" $FILES_TO_DELETE

    if [ -f $ZIP_FILE_NAME ]; then
        log "archive is success"

        while IFS= read -r filepath;
        do
            log "deleting a file : $filepath"
            log "deleted file: $filepath "

        done <<< $FILES_TO_DELETE
    else
        log "archive is failure.."
    fi
fi