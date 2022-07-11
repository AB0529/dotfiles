#!/bin/bash

ROFI_THEME=$XDG_CONFIG_HOME/rofi/styles.rasi

change_theme() {
    COLORS=$(cat $XDG_CONFIG_HOME/bspwm/themes/$1)

    # Add the colors to XResources
    cp $XDG_CONFIG_HOME/bspwm/themes/$THEME $XDG_CONFIG_HOME/X11/Xresources
    # Run rofi_gen script to change rofi colors
    $SCRIPTS/Theme/rofi_gen.sh > $XDG_CONFIG_HOME/rofi/colors.rasi
    # Refresh colors
    xrdb $XDG_CONFIG_HOME/X11/Xresources
    # Restart polybar
    $SCRIPTS/System/polybar.sh &>/dev/null

}

# Theme argument is not provided
if [[ -z "$1" ]]
then
    # Get the theme name and the file contents
    THEME=$(/bin/ls $XDG_CONFIG_HOME/bspwm/themes | rofi -dmenu -theme $ROFI_THEME)
    change_theme $THEME
else
    THEME=$1
    change_theme $THEME
fi
