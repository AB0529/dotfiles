#!/bin/bash 

file=$1
ext="${file##*.}"

case "$ext" in
    go) ;&
    yml) ;&
    json) ;&
    html) ;&
    css) ;&
    java) ;&
    py) ;&
    rs) $TERMINAL -e $EDITOR "$file" && exit 0;;
esac

xdg-open "$file"
