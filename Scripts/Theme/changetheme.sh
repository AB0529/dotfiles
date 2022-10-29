#!/bin/bash

# TODO: Clean up script

ROFI_THEME=$XDG_CONFIG_HOME/rofi/colors.rasi
DUNSTRC=$XDG_CONFIG_HOME/dunst/dunstrc

change_theme() {
    # Add the colors to XResources
    # cp $XDG_CONFIG_HOME/rofi/colors/$THEME $XDG_CONFIG_HOME/X11/Xresources

    cat $XDG_CONFIG_HOME/rofi/colors/$1 | sed -e "1,8d;9d;16d" -e 's/;\+$//' -e 's/..$//' -e 's/^/*/' -e 's/\\s\\+//g' > $XDG_CONFIG_HOME/X11/Xresources
    # Refresh colors
    xrdb $XDG_CONFIG_HOME/X11/Xresources

    # Remove old colors.rasi
    rm $ROFI_THEME

    # Create new one with new theme
    printf "@import \"~/.config/rofi/colors/$1\"" > $ROFI_THEME

    # Restart polybar
    $SCRIPTS/System/polybar.sh &>/dev/null

    # Dunst themes
    bg=$(xrdb -query | grep "* background:" | awk '{print $NF}')
    fg=$(xrdb -query | grep "* selected:" | awk '{print $NF}')

    # Delete lines 291-294 from dunstrc
    sed -i $DUNSTRC -re "291,294d"
    # Append new item with new colors
    printf "[urgency_normal]\n    background = \"$bg\"\n    foreground = \"$fg\"\n    timeout = 0" >> $DUNSTRC
    # Restart dunst service
    pkill dunst
}

# Theme argument is not provided
if [[ -z "$1" ]]
then
    # Get the theme name and the file contents
    THEME=$(/bin/ls $XDG_CONFIG_HOME/rofi/colors | rofi -dmenu -theme $XDG_CONFIG_HOME/rofi/message.rasi)
    change_theme $THEME
else
    THEME=$1
    change_theme $THEME
fi
