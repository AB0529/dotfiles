#!/bin/fish
# Load env vars
source $XDG_CONFIG_HOME/fish/env.fish

# Vanity
cat ~/.cache/wal/sequences
neofetch

# Load aliases file
[ -f "$XDG_CONFIG_HOME/fish/aliases" ] && source $XDG_CONFIG_HOME/fish/aliases
source $XDG_CONFIG_HOME/fish/git_aliases


# Starship prompt
starship init fish | source
