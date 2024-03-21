# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=40000
SAVEHIST=40000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/datpc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#Start starship prompt
eval "$(starship init zsh)"
