#!/bin/sh

source=$(pactl info | grep -i "default source" | cut -d ' ' -f3)
mute=$(pactl list | grep -ia6 "$MICROPHONE" | grep -i "mute" | cut -d ' ' -f2 | awk 'END {print $1}')
vol=$(pactl list | grep -ia7 "$MICROPHONE" | grep -i "volume" | awk 'END {print $5}')
inc=5

case "$1" in
	mute) pactl set-source-mute $source "toggle" && notify-send -t 3000 -i "$HOME/.icons/mic-ico.png" "Mute toggle" ;;
	volup) pactl set-source-volume $source +$inc% ;;
    voldown) pactl set-source-volume $source -$inc% ;;
esac

[ "$mute" = "yes" ] && echo " $vol" && exit

echo " $vol"
