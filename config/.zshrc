# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# Поиск по истории стрелками
bindkey -e
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

autoload -Uz compinit
compinit

eval "$(rbenv init - zsh)"

export EDITOR=${EDITOR:-nano}
export BROWSER=${BROWSER:-firefox}
export GIT_EDITOR=${GIT_EDITOR:-nano}

source ~/dotfiles/config/.aliases.zsh
source ~/dotfiles/config/.functions.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

# Переход в папку без cd и удаление слова по Ctrl + W
setopt AUTO_CD
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey '^W' backward-kill-word

