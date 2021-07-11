#!/bin/sh
microphone="alsa_input.pci-0000_00_14.2.analog-stereo"
#microphone="alsa_input.pci-0000_00_14.2.analog-stereo"

source=$(pacmd list-sources | grep "*" -A1 | awk 'FNR==2 { print $2 }' | sed -e 's/<\|>//g')
mute=$(pacmd list-sources | grep "*" -A11 | awk 'END {print $2}')
vol=$(pacmd list-sources | grep "*" -A7 | awk 'END {print ($5+0)}')
inc=5

case "$1" in
	mute) [ $mute = "yes" ] && pactl set-source-mute $source "no" || pactl set-source-mute $source "yes" ;;
	volup) pactl set-source-volume $source +$inc% ;;
    voldown) pactl set-source-volume $source -$inc% ;;
esac

[ $mute = "yes" ] && echo " $vol%" && exit

echo " $vol%"
