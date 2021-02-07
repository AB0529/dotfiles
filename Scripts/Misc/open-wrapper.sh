#!/bin/bash 

file=$1
ext="${file##*.}"

case "$ext" in
    go) ;&
    py) ;&
    rs) $TERMINAL -e $EDITOR $file ;;
    *) xdg-open $file ;;
esac
