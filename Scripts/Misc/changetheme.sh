#!/bin/bash

/bin/ls $HOME/.config/bspwm/themes | rofi -dmenu -theme ~/.config/rofi/styles.rasi | xargs -i fish -c 'xrdb $HOME/.config/bspwm/themes/{} | cat $HOME/.config/bspwm/themes/{} > $HOME/.config/X11/Xresources' && $HOME/Scripts/Misc/rofi_gen.sh > $HOME/.config/rofi/colors.rasi 
