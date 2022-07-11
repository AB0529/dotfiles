#!/usr/bin/env bash
# Generates an alacritty color config from currently loaded X resources.

printf '* {\n'
printf '	al: %s80;\n' "$(xgetres 'background')"
printf '	bg: %s80;\n' "$(xgetres 'background')"
printf '	bga: %s80;\n' "$(xgetres 'background')"
printf '	fg: %s80;\n' "$(xgetres 'foreground')"
printf '	ac: %s80;\n' "$(xgetres 'color2')"
printf '	se: %s80;\n' "$(xgetres 'color2')"
printf '}'
