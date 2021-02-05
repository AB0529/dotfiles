# Flex
cat ~/.cache/wal/sequences
neofetch

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Change cursor to | beam
printf '\033[5 q\r'
# Jump words on ctl+arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Load aliases if existent
[ -f "$XDG_CONFIG_HOME/zsh/aliases" ] && source $XDG_CONFIG_HOME/zsh/aliases

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/git/git.zsh

# Starship prompt
eval "$(starship init zsh)"
