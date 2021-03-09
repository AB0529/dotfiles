#!/bin/fish
set -e fish_greeting

set TERMINAL /usr/bin/alacritty
set BROWSER /usr/bin/librewolf
set EDITOR /usr/bin/nvim

 set XDG_CONFIG_HOME "$HOME/.config"
 set XDG_CACHE_HOME "$HOME/.cache"
 set XDG_DATA_HOME "$HOME/.local/share"
 set XDG_DESKTOP_DIR "$HOME"
 set XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"
 set CODING $HOME/Coding
 set PICS $HOME/Pics

 set SCRIPTS $HOME/Scripts
 set GOPATH $CODING/.gopath:$CODING/Go
 set GO111MODULE 'on'
 set RUSTUP_HOME "$XDG_DATA_HOME"/rustup
