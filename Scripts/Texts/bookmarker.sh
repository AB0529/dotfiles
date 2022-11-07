#!/bin/bash

FILE=$HOME/Documents/bookmarks

mark() {
    BOOKMARK=$(xclip -o)
    [ -z "$BOOKMARK" ] && exit 1

    if grep -q "^${BOOKMARK}$" "$FILE"; then
        notify-send -t 3000 "Bookmark" "Error already have \"$BOOKMARK\" in file" -i $PICS/Icons/bookmark-ico.png
    else
        echo $BOOKMARK >> $FILE
        notify-send -t 3000 "Bookmark" "Added \"$BOOKMARK\" to file" -i $PICS/Icons/bookmark-ico.png
    fi
}

list() {
    SEL=$(cat $FILE | rofi -dmenu -no-config -no-lazy-grab -p  -theme ~/.config/rofi/message.rasi)

    [ -z "$SEL" ] && exit 1

    notify-send -t 3000 "Copied \"$SEL\" to clipboard" -i $PICS/Icons/bookmark-ico.png
    echo $SEL | xclip -sel c
}

case $1 in
    mark) mark ;;
    list) list ;;
esac

