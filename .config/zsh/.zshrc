# Colors
autoload -U colors && colors
PROMPT="jack@enigma "

# Aliases
alias config='git --git-dir=$HOME/.cfg-git/ --work-tree=$HOME'

# Shell Histories
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify

# Vim keybindings
bindkey -v
export KEYTIMEOUT=1

# Completions
autoload -Uz compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
