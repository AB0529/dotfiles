#!/bin/bash

HISTORY_FILE=/tmp/googler_history

# Create history file is not exists
if [ -f "$HISTORY_FILE" ]; then
    QUERY=$(cat $HISTORY_FILE | rofi -dmenu -p  -theme ~/.config/rofi/message.rasi)
else
    touch $HISTORY_FILE
    QUERY=$(rofi -dmenu -p  -theme ~/.config/rofi/message.rasi)
fi

if [ ! -z "$QUERY" ]; then
    $BROWSER --new-window "https://www.google.com/search?q=$QUERY"

    # Append to history file
    echo $QUERY >> $HISTORY_FILE

    # Remove duplicates
    awk -i inplace '!seen[$0]++' $HISTORY_FILE
fi
