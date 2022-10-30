#!/bin/bash

set -e
pidof -o %PPID -x $0 >/dev/null && echo "ERROR: Script $0 already running" && exit 1

TO_BACKUP="$HOME/Pics $HOME/Documents $HOME/.ssh"
BACKUP_DIR="/mnt/Extra/Backups"

TIMESTAMP=$(date +"%a-%m-%d-%y_%Ih%Mm-%p")

SYNC_ICON="$PICS/icons/sync-ico.png"
ERROR_ICON="$PICS/icons/error-ico.png"

# Remove if too many backups are present
ls -tp $BACKUP_DIR | grep -v '\$' | tail -n +5 | xargs -I {} -- rm $BACKUP_DIR/{} 

backup() {
    echo $BACKUP_DIR/$TIMESTAMP.tar.gz
    tar --exclude="node_modules" -zcvf "$BACKUP_DIR/$TIMESTAMP.tar.gz" $TO_BACKUP
}

notify-send -t 3000 -i $SYNC_ICON "Backup" "Backup has started..." && \
backup && \
notify-send -t 3000 -i $SYNC_ICON "Backup" "Backup finished!" || \
notify-send -t 5000 -i $ERROR_ICON "Backup" "Backup failed!!"
