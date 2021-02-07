export TERMINAL=/usr/bin/alacritty
export BROWSER=/usr/bin/librewolf
export EDITOR=/usr/bin/nvim
export OS=`uname`

if [ "$OS" = "Darwin" ]; then
    export CODING=$HOME/Documents/Coding
    export PICS=$HOME/Pictures
# Assume it's Linux
else
    # XDG
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_DESKTOP_DIR="$HOME"
    export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

    export ZDOTDIR=$HOME/.config/zsh

    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
    export CODING=$HOME/Coding
    export PICS=$HOME/Pics

fi

export SCRIPTS=$HOME/Scripts
export GOPATH=$CODING/.gopath:$CODING/Go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
