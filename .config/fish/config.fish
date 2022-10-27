# Load env vars
set -U fish_greeting ""
posix-source $HOME/.env

# Vanity
cat ~/.cache/wal/sequences
neofetch
cd

# Load aliases file
[ -f "$XDG_CONFIG_HOME/fish/aliases" ] && source $XDG_CONFIG_HOME/fish/aliases
source $XDG_CONFIG_HOME/fish/git_aliases

# Starship prompt
starship init fish | source
# SSH Agent
#fish_ssh_agent
