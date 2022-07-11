#!/bin/bash 
NOTESPATH=$HOME/Documents/Notes

# Open list of notes from directory
NOTE=$(ls $NOTESPATH | rofi -dmenu -no-config -no-lazy-grab -theme styles.rasi)

[ -z "$NOTE" ] && exit 0

# Normalize function to fix names
normilize() {
    local c1=$(basename $1 '.md' | sed -r 's/(^|_|-)([a-z])/ \U\2/g' )

    echo "#$c1"
}

# Create note file if not existent
[ ! -f "$NOTESPATH/$NOTE" ] && normilize $NOTE > $NOTESPATH/$NOTE

# Open notes in vim
[ ! -z "$NOTE" ] && $TERMINAL --class AB-Notes -t AB-Notes -e nvim -c 'norm Go' -c 'norm ddpp' -c 'startinsert' $NOTESPATH/$NOTE
