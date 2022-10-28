#!/bin/bash

# TODO: Clean up script

ROFI_THEME=$XDG_CONFIG_HOME/rofi/colors.rasi

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
