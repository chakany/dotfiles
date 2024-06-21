export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export EDITOR="nvim"
export VISUAL="lazy"

platform=$(uname)

# helper functions for our platform-specific scripts
command_exists() {
    command -v "$1" > /dev/null 2>&1
}

if [[ $platform == "Linux" ]]; then
  if command_exists doas; then
    alias sudo="doas" # doas is goated
  fi
elif [[ $platform == "Darwin" ]]; then
  # weird path stuff they have going on at macos, though it cool for programs to be able to add things to their path like this. 
  PATH=$PATH:$(/usr/libexec/path_helper -s)
fi

if command_exists nvm; then
  export NVM_DIR=~/.nvm
  source $NVM_DIR/nvm.sh
fi

