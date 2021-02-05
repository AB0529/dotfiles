#!/bin/bash
wp=$1

[ ! -f "$wp" ] && echo "File not found." && exit 1

cp $wp $HOME/.wallpaper.jpg || exit 1
xwallpaper --zoom $wp && echo "Done"
