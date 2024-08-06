source ~/.zshsecrets

# Colors
autoload -U colors && colors
setopt PROMPT_SUBST # refresh prompt
check_writable() {
  if [ -r $PWD ] && [ -w $PWD ]; then
    # do literally nothing
  else
    echo "󰉐 "
  fi
}

make_prompt() {
  local new_prompt="%{$fg[red]%}%{$reset_color%}%B%{$fg[white]%}%{$bg[red]%}$(check_writable)${PWD/#$HOME/~}%b%{$reset_color%}%{$fg[red]%}"
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)
    local git_status=$(git status --porcelain)
    new_prompt=$new_prompt"%K{202} %B%{$fg[white]%}"
    if [[ -n $git_status ]]; then
      new_prompt=$new_prompt" $branch"
    else
      new_prompt=$new_prompt" $branch"
    fi
    new_prompt=$new_prompt"%b%{$reset_color%}%F{202}"
  fi
  new_prompt=$new_prompt"%{$reset_color%}"
  echo $new_prompt
}
PROMPT='$(make_prompt) '

# Aliases
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source $HOME/.nix-profile/etc/profile.d/nix.sh

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
