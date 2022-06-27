#!/bin/bash
# Open wallpapers in SXIV and get the selected output
wallpaper=`sxiv -rtqo /home/ab/Pics/Wallpapers`
# Set wallpaper if not empty
[ -z "$wallpaper" ] && echo "Press 'm' to mark!" || cp $wallpaper $HOME/.wallpaper.jpg && xwallpaper --zoom $HOME/.wallpaper.jpg
