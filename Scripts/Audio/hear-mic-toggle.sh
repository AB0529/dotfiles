#!/bin/sh

TOGGLE=~/Scripts/.hear-mic-toggle
HEAR_ICO=~/Pics/Icons/speak-ico.png
NO_HEAR_ICO=~/Pics/Icons/speaker-mute-ico.png

hear() {
	touch $TOGGLE
	pactl load-module module-loopback latency_msec=1
	notify-send -t 3000 -i $HEAR_ICO "Hear Microphone" "Now nearing microphone"
}

stophear() {
	rm $TOGGLE
	pactl unload-module module-loopback
	notify-send -t 3000 -i $NO_HEAR_ICO "Hear Microphone" "No longer hearing microphone"
}

[ ! -e $TOGGLE ] && hear || stophear
