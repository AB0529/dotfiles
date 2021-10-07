#!/usr/bin/env bash
# Generates an alacritty color config from currently loaded X resources.

xrdb_grep() {
    xrdb -query | grep "$1" | cut -f 2 | head -1
}

color_from_line() {
    read -r line && readonly line
    echo "${line/\#/0x}" | tr -d '[:space:]' | cut -d ':' -f 2
}

printf '* {\n'
printf '	al: %s80;\n' "$(xrdb_grep 'background')"
printf '	bg: %s80;\n' "$(xrdb_grep 'background')"
printf '	bga: %s80;\n' "$(xrdb_grep 'background')"
printf '	fg: %s80;\n' "$(xrdb_grep 'foreground')"
printf '	ac: %s80;\n' "$(xrdb_grep 'color1')"
printf '	se: %s80;\n' "$(xrdb_grep 'color1')"
printf '}'
