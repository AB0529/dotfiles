#!/bin/bash
event=`$CODING/Go/calander/calander`
ICON="$HOME/Pics/Icons/calander-ico.png"

case "$1" in 
    notify) notify-send -i $ICON "Calander" "$event" ;;
esac

notify() {
    echo "🔔" 

    file="$HOME/.cache/calander-event"
    [ ! -f "$file" ] && touch $file && echo $event >> $file

    if [ ! "$(cat $HOME/.cache/calander-event)" = "$event" ]; then 
        notify-send -i $ICON "Calander" "$event" && play -v 0.3 $HOME/Documents/dio-time-stop.mp3 2>/dev/null
        rm -f $file
    fi
}

[ ! "$event" = "None" ] && notify || echo ""
