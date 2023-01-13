#!/bin/bash

ROFI_THEME="$HOME/.config/rofi/message.rasi"
PROGRAMS="$HOME/Scripts/Misc/programs/*"
ON_LIST="/tmp/program_viewer"
declare -a PROGRAM_ARR
PROGRAM_STR=""
i=0

# Create rofi launcher icons with programs
for f in $PROGRAMS; do
    ((i=i+1))
    NAME=$(tail -1 $f)
    LOCKF=$(head -1 $f)


    # Icon if program is on or not
    if [ -f "$ON_LIST/$LOCKF" ]; then
        PROGRAM_STR+="$i. 🟢 $NAME\n"
    else
        PROGRAM_STR+="$i. 🔴 $NAME\n"
    fi

    PROGRAM_AR[$i]=$f
done

C=$(echo -e $PROGRAM_STR | sed '$d' | rofi -dmenu -theme $ROFI_THEME || exit 1)
CHOICE=$(echo $C | cut -d. -f1)
PROGRAM=$(echo "${PROGRAM_AR["$CHOICE"]}")

[ -z "$CHOICE" ] && exit 1

# Kill if on, start if off
LOCKF=$(head -1 $PROGRAM)
EXEC=$(head -2 $PROGRAM | tail -1)

if [ -f "$ON_LIST/$LOCKF" ]; then
    echo "OFF $EXEC"
    pkill $(basename $EXEC)
    # Remove lock file
    rm $ON_LIST/$LOCKF
else
    echo "ON $EXEC"
    exec $EXEC &
fi

