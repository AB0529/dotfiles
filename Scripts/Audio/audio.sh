#!/bin/sh
speakers="alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"
headphones="alsa_output.pci-0000_08_00.3.analog-stereo"

sink=$(pacmd list-sinks | grep "*" -A1 | awk 'FNR==2 { print $2 }' | sed -e 's/<\|>//g')
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
inc=5

case "$1" in
    mute) [ $mute = true ] && pactl set-sink-mute $sink "no" || pactl set-sink-mute $sink "yes" ; pkill -RTMIN+15 dwmblocks ;;
    volup) pactl set-sink-volume $sink +$inc% ;;
    voldown) pactl set-sink-volume $sink -$inc% ;;
esac

[ $mute = true ] && echo "🔇 $vol%" && exit
[ $sink = $speakers ] && echo "🔉 $vol%" || echo "🎧 $vol%"
