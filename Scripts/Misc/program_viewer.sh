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
    TYPE=$(head -1 $f | cut -d= -f2)
    NAME=$(tail -1 $f | cut -d= -f2)
    
    # No lock file needed
    if [ "$TYPE" = "2" ]; then
        PROGRAM_STR+="$i. $NAME\n"
        PROGRAM_AR[$i]=$f
        continue
    fi

    LOCKF=$(head -2 $f | tail -1 | cut -d= -f2)

    # Icon if program is on or not
    if [ -f "$ON_LIST/$LOCKF" ]; then
        PROGRAM_STR+="$i. $NAME 🟢\n"
    else
        PROGRAM_STR+="$i. $NAME\n"
    fi

    PROGRAM_AR[$i]=$f
done

C=$(echo -e $PROGRAM_STR | sed '$d' | rofi -dmenu -theme $ROFI_THEME || exit 1)
CHOICE=$(echo $C | cut -d. -f1)
PROGRAM=$(echo "${PROGRAM_AR["$CHOICE"]}")

[ -z "$CHOICE" ] && exit 1

# Kill if on, start if off
TYPE=$(head -1 $PROGRAM | cut -d= -f2)
LOCKF=$(head -2 $PROGRAM | tail -1 | cut -d= -f2)
EXEC=$(tail -2 $PROGRAM | head -1 | cut -d= -f2)

# Just exec if type is 2
if [ "$TYPE" = "2" ]; then
    echo "ON TYPE 2 $EXEC"
    exec $EXEC &
    exit 0
fi

if [ -f "$ON_LIST/$LOCKF" ]; then
    echo "OFF $EXEC"
    pkill $(basename $EXEC)
    # Remove lock file
    rm $ON_LIST/$LOCKF
else
    echo "ON $EXEC"

    mkdir $ON_LIST
    touch "$ON_LIST/$LOCKF"
    exec $EXEC &
fi

