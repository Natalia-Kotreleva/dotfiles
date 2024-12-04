# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/natalia/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(rbenv init -)"

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

export EDITOR=${EDITOR:-nano}
export BROWSER=${BROWSER:-firefox}
export GIT_EDITOR=${GIT_EDITOR:-nano}

source ~/dotfiles/config/.aliases.zsh
source ~/dotfiles/config/.functions.zsh
