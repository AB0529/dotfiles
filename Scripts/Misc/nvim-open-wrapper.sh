#!/bin/bash

file=$1
fileMime=$(xdg-mime query filetype "$file")
type=$(echo $fileMime | cut -f1 -d "/")
t=$(echo $fileMime | awk -F/ '{ print $NF }')

case "$t" in
    gif) mpv "$file" && exit 0;;
    pdf) mupdf "$file" && exit 0;;
esac

case "$type" in
    image) sxiv "$file" && exit 0;;
esac

$TERMINAL -e $EDITOR "$file" && exit 0
