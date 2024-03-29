
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export ZSH_PLUGIN=$HOME/.dotfiles/zsh-plugins
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

# Make sure fzf-tab is sourced after autoload compinit and before another zsh plugins.
source "$ZSH_PLUGIN/fzf-tab/fzf-tab.plugin.zsh"

# Add syntax highlighting, autosuggestion feature like fish
source "$ZSH_PLUGIN/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGIN/zsh-z/zsh-z.plugin.zsh"
source "$ZSH_PLUGIN/zsh-fzf-history-search/zsh-fzf-history-search.zsh"
# Start starship prompt
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-ctrl-r)"
