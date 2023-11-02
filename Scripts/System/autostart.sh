#!/bin/bash
pidof -o %PPID -x $0 >/dev/null && echo "ERROR: Script $0 already running" && exit 1

# Set path
export PATH=$HOME/.local/bin:$HOME/.var/app/com.valvesoftware.Steam/data/applications:$PATH
# Load other vars
export $(cat $HOME/.env | awk 'NF' | xargs -L 1)
# Load theme var
export THEME=$(cat $HOME/.theme)

# Xrandr
xrandr --output $PRIMARY_DISPLAY --primary --output $SECONDARY_DISPLAY --left-of $PRIMARY_DISPLAY --output $SECONDARY_DISPLAY --rotate left 

# Set cursor
xsetroot -cursor_name left_ptr
# Disable screen blackout
xset s off -dpms

# Hotkey Daemon
sxhkd -c $HOME/.config/sxhkd/bspwm \
    $HOME/.config/sxhkd/system \
    $HOME/.config/sxhkd/apps \
    $HOME/.config/sxhkd/audio &

sh-changetheme $THEME.rasi &

unclutter -idle 3 &
# xwallpaper --zoom .wallpaper.jpg
xwallpaper --zoom .wallpaper.jpg
picom &

# Misc
greenclip clear
greenclip daemon &
blueman-tray
alacritty

# Finally, create a backup
$SCRIPTS/System/backuper.sh &
