#!/bin/sh

[ ! -f "$1" ] && echo "File not found." && exit 1 

wal -ni $1 -o $HOME/Scripts/wal_dwm_xresources.sh

echo "Reload now"
