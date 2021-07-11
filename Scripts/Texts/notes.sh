#!/bin/bash 
noteFilename=$HOME/Documents/Notes/notes.md

# Create note file if not existent
[ ! -f $noteFilename ] && echo "# Notes for `date +%Y-%m-%d`" > $noteFilename

# Open notes in vim
nvim -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $noteFilename
