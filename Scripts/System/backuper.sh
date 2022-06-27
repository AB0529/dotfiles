#!/bin/bash
set -e

to_backup="$HOME/Pics $HOME/Documents $HOME/.ssh"
backup_dir="/media/Extra/Backups"
timestamp=$(date +"%a-%m-%d-%y_%I:%M-%p")
sync_icon="$PICS/Icons/sync-ico.png"
error_icon="$PICS/Icons/error-ico.png"

# Remove if too many backups are present
ls -tp $backup_dir | grep -v '\$' | tail -n +5 | xargs -I {} -- rm $backup_dir/{} 

backup() {
    tar --exclude="node_modules" -zcvf "$backup_dir/$timestamp.tar.gz" $to_backup
}

notify-send -t 3000 -i $sync_icon "Backup" "Backup has started..." && \
backup && \
notify-send -t 5000 -i $sync_icon "Backup" "Backup finished!" || \
notify-send -t 5000 -i $error_icon "Backup" "Backup failed!!"
