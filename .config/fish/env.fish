#!/bin/fish
set -e fish_greeting

set -g TERMINAL /usr/bin/alacritty
set -g BROWSER /usr/bin/librewolf
set -g EDITOR /usr/bin/nvim
set -g TZ "America/New_York"

set -g XDG_CACHE_HOME "$HOME/.cache"
set -g XDG_CONFIG_HOME "$HOME/.config"
set -g XDG_DATA_HOME "$HOME/.local/share"
set -g XDG_DESKTOP_DIR "$HOME"
set -g XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

 set CODING $HOME/Coding
 set PICS $HOME/Pics

 set SCRIPTS $HOME/Scripts
 set GOPATH $CODING/.gopath:$CODING/Go
 set GO111MODULE 'on'
 set RUSTUP_HOME "$XDG_DATA_HOME"/rustup
