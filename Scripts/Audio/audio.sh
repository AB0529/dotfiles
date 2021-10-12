#!/bin/sh
speakers="alsa_output.pci-0000_08_00.3.analog-stereo"
headphone="alsa_output.usb-Razer_Razer_Nari_Essential-00.analog-stereo"

sink=$(pacmd list-sinks | grep "*" -A1 | awk 'FNR==2 { print $2 }' | sed -e 's/<\|>//g')
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
inc=5

case "$1" in
    mute) [ $mute = true ] && pactl set-sink-mute $sink "no" || pactl set-sink-mute $sink "yes" ; pkill -RTMIN+15 dwmblocks ;;
    volup) pactl set-sink-volume $sink +$inc% ;;
    voldown) pactl set-sink-volume $sink -$inc% ;;
    volset) 
        v=$(rofi -dmenu -p "🔊 Set Volume" -lines 0 -separator-style "none" -theme ab-theme.rasi &)
        wait
        echo $v
        [ $v -gt 100 ] && v=100
        [ $v -lt 0 ] && v=0
        pactl set-sink-volume $sink $v% ;;
esac

[ $sink = $speakers ] && echo "墳" || echo ""
