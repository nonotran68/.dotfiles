
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
HISTSIZE=40000
SAVEHIST=40000


setopt autocd
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/datpc/.zshrc'

autoload -Uz compinit; compinit
# End of lines added by compinstall

source "$HOME/.dotfiles/zsh-plugins/fzf-tab/fzf-tab.plugin.zsh"

# Start starship prompt
eval "$(starship init zsh)"
