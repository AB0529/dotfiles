#!/bin/sh

# Where to save the weather report for the day
report="$HOME/Scripts/.weather-report"

# Get the forecast for the day
forecast() {
	curl -sf "wttr.in" > $report || exit 1
}
# Steam manipulation to get the weather details
weather() {
	printf "%s" "$(sed '16q;d' $report | grep -wo "[0-9]*%" | sort -rn | sed "s/^/☂️ /g;1q" | tr -d '\n')"
	sed '13q;d' $report | grep -o "m\\([-+]\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr '\n|m' ' ' | awk '{print " 🧊 " $1 "°","🌤 "$2 "°"}' 
}
# Test if forecast is updated for the day
# If it isn't, download new report
[ "$(stat -c %y $report 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] || forecast

case $1 in
	sync*)
		forecast && notify-send -i "$HOME/Pictures/Icons/sync-ico.png" -t 1500 "Weather" "Weather has been synced"
	;;
	term*)
		setsid -f "st" -e less -Srf "$report"
	;;
	*)
		weather
	;;
esac