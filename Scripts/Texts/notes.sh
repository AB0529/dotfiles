#!/bin/bash 
noteFilename=$HOME/Documents/notes.md

# Create note file if not existent
[ ! -f $noteFilename ] && echo "# Notes" > $noteFilename

# Open notes in vim
nvim -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $noteFilename
