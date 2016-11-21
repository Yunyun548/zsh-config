# Created by yun
autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

#Arrow keys completion
zstyle ':completion:*' menu select

# Alt + Up to go back to parent directory in file manager
cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey

bindkey '^[[1;3A'      cdParentKey

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Theme
ZSH_THEME="agnoster"
#POWERLINE_GIT_CLEAN="✔"
#POWERLINE_GIT_DIRTY="✘"
#POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
#POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
#POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
#POWERLINE_GIT_UNTRACKED="%F{yellow}✭%F{black}"
#POWERLINE_GIT_RENAMED="➜"
#POWERLINE_GIT_UNMERGED="═"

# Miscelleanous
DISABLE_AUTO_UPDATE="true"

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# The Fuck alias
eval "$(thefuck --alias)"

# List docker containers and their ip
alias docker-ip="docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)"

# Rofi Alias for cinnamon shortcuse use
alias rofimenu="rofi -show run -width 600 -font 'Source Code Pro for Powerline Bold 13' -lines 8"
