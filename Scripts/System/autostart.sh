#!/bin/bash

# Audio
pipewire &
pipewire-pulse &

# Xrandr
xrandr --output HDMI-A-0 --primary --output DisplayPort-0 --left-of HDMI-A-0 --output DisplayPort-0 --rotate right

# Set cursor
xsetroot -cursor_name left_ptr &

# Hotkey Daemon
sxhkd -c $HOME/.config/sxhkd/bspwm \
    $HOME/.config/sxhkd/system \
    $HOME/.config/sxhkd/apps \
    $HOME/.config/sxhkd/audio &

sh-changetheme $THEME.rasi &

unclutter -idle 3 &
xwallpaper --zoom .wallpaper.jpg
picom &
pipewire-media-session &
