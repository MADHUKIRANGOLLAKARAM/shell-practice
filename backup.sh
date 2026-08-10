#!/bin/bash

USER_ID=$(id -u)
LOGS_DIR="/var/log/shell-script"
LOG_FILE="$LOGS_DIR/$(basename $0).log"
SOURCE_DIR="$1"
DESTINATION_DIR="$2"
DAYS=${3:-10}  #10 days as default

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

if [ ! -d $SOURCE_DIR ]; then
    echo "source directory :$SOURCE_DIR is not exist"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo "destination directory :$DESTINATION_DIR is not exist"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log(){
    echo -e "$(date "+%y-%m-%d:%H:%M:%s") | $1 "
}

log "backup started..."
log "source directory : $SOURCE_DIR"
log "destination directory : $DESTINATION_DIR "
log "days :$DAYS"

while IFS= read -r filepath;
do 
    log "deleating file : $filepath"
    log "deleated file : $filepath"

done <<< $FILES_TO_DELETE