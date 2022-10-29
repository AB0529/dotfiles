#!/bin/sh
microphone="alsa_input.usb-Corsair_CORSAIR_HS70_Pro_Wireless_Gaming_Headset-00.mono-fallback"

source=$(pactl info | grep -i "default source" | cut -d ' ' -f3)
mute=$(pactl list | grep -ia6 "$microphone" | awk 'END {print $2}')
vol=$(pactl list | grep -ia7 "$microphone" | awk 'END {print $5}')
inc=5

case "$1" in
	mute) [ $mute = "yes" ] && pactl set-source-mute $source "no" || pactl set-source-mute $source "yes" ;;
	volup) pactl set-source-volume $source +$inc% ;;
    voldown) pactl set-source-volume $source -$inc% ;;
esac

[ $mute = "yes" ] && echo " $vol" && exit

echo " $vol"
