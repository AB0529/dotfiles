#!/bin/bash
WALLPAPER_DIR=$PICS/Wallpapers
# Open wallpapers in SXIV and get the selected output
wallpaper=`sxiv -rtqo $WALLPAPER_DIR`
# Set wallpaper if not empty
[ -z "$wallpaper" ] && echo "Press 'm' to mark!" || cp $wallpaper $HOME/.wallpaper.jpg && feh --bg-fill $HOME/.wallpaper.jpg
