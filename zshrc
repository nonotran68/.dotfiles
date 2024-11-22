
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export ZSH_PLUGIN=$HOME/.dotfiles/zsh-plugins
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -f -g ""'
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin

HISTSIZE=40000
SAVEHIST=40000

####################
###    ALIAS     ###
####################
alias sudo='sudo '
alias c=clear
alias l='lsd --group-directories-first'
alias ll='lsd -la --group-directories-first'
alias v=nvim
alias vf='nvim $(fzf --preview="bat --color=always {}" --reverse)'
alias activate_venv="source ~/venv-arch/.venv/bin/activate"

setopt autocd
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install

# add tab completions support for poetry
fpath+=$HOME/.dotfiles/.zfunc

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "$HOME/.zshrc"

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
# eval "$(atuin init zsh --disable-ctrl-r)"

jlab ()
{
    tmux new-session -d -s jupyter 'jupyter lab'
}

# fnm
FNM_PATH="/home/datpc/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/datpc/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

eval "$(fnm env --use-on-cd --shell zsh)"

source <(fzf --zsh)

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
