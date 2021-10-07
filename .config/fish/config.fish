# Load env vars
source $HOME/.config/fish/env.fish

# Vanity
cat ~/.cache/wal/sequences
neofetch

# Load aliases file
[ -f "$XDG_CONFIG_HOME/fish/aliases" ] && source $XDG_CONFIG_HOME/fish/aliases
source $XDG_CONFIG_HOME/fish/git_aliases

# Starship prompt
starship init fish | source
# SSH Agent
fish_ssh_agent
