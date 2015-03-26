#!/bin/bash

SOURCE="/"
DEST="/media/root/"
EXCLUDE="/home/pi/Utils/backup/rsync-root.exclude"
LOGFILE="/home/pi/Utils/backup/rsync.log"

if ! [[ -d $DEST ]];
then
    echo -e "The destination directory '$DEST' either doesn't exist or isn't writable!."
    echo -e "If this is the first backup, uncomment the 'exit' below."
    exit
fi 

sudo rsync -avuPh  --dry-run --delete --stats --log-file=$LOGFILE --exclude-from $EXCLUDE $SOURCE $DEST
