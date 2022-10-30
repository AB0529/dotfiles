#!/bin/bash
pidof -o %PPID -x $0 >/dev/null && echo "ERROR: Script $0 already running" && exit 1

# Set path
export PATH=$HOME/.local/bin:$PATH
# Load other vars
export $(cat $HOME/.env | awk 'NF' | xargs -L 1)
# Load theme var
export THEME=$(cat $HOME/.theme)

# Xrandr
xrandr --output HDMI-A-0 --primary --output DisplayPort-1 --left-of HDMI-A-0 --output DisplayPort-1 --rotate right

# Set cursor
xsetroot -cursor_name left_ptr

# Hotkey Daemon
sxhkd -c $HOME/.config/sxhkd/bspwm \
    $HOME/.config/sxhkd/system \
    $HOME/.config/sxhkd/apps \
    $HOME/.config/sxhkd/audio &

sh-changetheme $THEME.rasi &

unclutter -idle 3 &
# xwallpaper --zoom .wallpaper.jpg
xwallpaper --output $PRIMARY_DISPLAY  --zoom  .wallpaper.jpg --output $SECONDARY_DISPLAY --trim 1920x1080+350+0 --zoom  .wallpaper.jpg
picom &

greenclip clear
greenclip daemon &

# Finally, create a backup
$SCRIPTS/System/backuper.sh &
