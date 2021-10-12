#!/bin/bash

if [ -z "$1" ]; then 
    /bin/ls $HOME/.config/bspwm/themes | rofi -dmenu -theme ~/.config/rofi/styles.rasi | xargs -i fish -c 'xrdb $HOME/.config/bspwm/themes/{} | cat $HOME/.config/bspwm/themes/{} > $HOME/.config/X11/Xresources' && $HOME/Scripts/Misc/rofi_gen.sh > $HOME/.config/rofi/colors.rasi 
else
    xrdb $HOME/.config/bspwm/themes/$1 | cat $HOME/.config/bspwm/themes/$1 > $HOME/.config/X11/Xresources && $HOME/Scripts/Misc/rofi_gen.sh > $HOME/.config/rofi/colors.rasi && $HOME/Scripts/System/polybar.sh
fi
