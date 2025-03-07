# Lines configured by zsh-newuser-install

export PATH=$PATH:/usr/local/go/bin
export HISTFILE=~/.histfile
export ZSH_PLUGIN=$HOME/.dotfiles/zsh-plugins
export FZF_DEFAULT_COMMAND='ag --hidden --ignore={.git,node_modules} -l -f -g ""'
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules
  --preview 'lsd --tree --color=always {} | head -250'"
export PATH=$PATH:$HOME/.local/bin:/usr/local/go/bin

fpath=($HOME/.dotfiles/zsh-plugins/zsh-completions/src $fpath)

HISTSIZE=40000
SAVEHIST=40000

####################
###    ALIAS     ###
####################

local V=nvim

alias sudo='sudo '
alias c=clear
alias l='lsd --group-directories-first'
alias ll='lsd -la --group-directories-first'
alias v=$V
alias activate_venv="source ~/venv-arch/.venv/bin/activate"

# unalias run-help
# autoload run-help
# HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help
# alias help=run-help

setopt autocd
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
# End of lines configured by zsh-newuser-install

# add tab completions support for poetry
fpath+=$HOME/.dotfiles/.zfunc


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
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

#JUNEGUNN TIP FOR FZF

rfv() (
  RELOAD='reload:rg --hidden --glob "!.git" --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,<80(up)' \
      --query "$*"
)

zz() {
  local dir=$(
    z 2>&1 |
    fzf --height 40% --layout reverse --info inline \
        --nth 2.. --tac --no-sort --query "$*" \
        --bind 'enter:become:echo {2..}' \
        --preview='lsd --color=always --tree {2..}'
  ) && cd "$dir"
}

#Better vf
fv() {
  # Chọn file bằng fzf
  fzf --preview \
    'bat --style=numbers --color=always --line-range :500 {}' \
    --height=60% \
    --preview-window=right:60% \
    --reverse \
    --multi \
    --bind "enter:become($V {+})" \
    --bind "ctrl-o:execute($V {+})" \
    --query "$*"
}

## Quickly kill process
alias qkill="ps -eo pid,command | fzf --reverse --height=60% | awk '{print $1}' | xargs -r kill"

# Convert video to gif file.
# Usage: video2gif video_file (scale) (fps)
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

#HEX2TEXT
hex2txt() {
    # Kiểm tra input
    if [[ -z "$1" ]]; then
        echo "Error: Vui lòng cung cấp chuỗi hex"
        return 1
    fi

    # Xóa khoảng trắng và ký tự thừa
    local hex_cleaned=$(echo "$1" | tr -d '[:space:]')

    # Kiểm tra độ dài chẵn
    if [[ $(( ${#hex_cleaned} % 2 )) -ne 0 ]]; then
        echo "Error: Chuỗi hex phải có độ dài chẵn"
        return 1
    fi

    # Chuyển từng cặp hex sang \xHH và dùng printf để decode
    printf "%b\n" "$(echo "$hex_cleaned" | sed 's/../\\x&/g')"
}

alias gcb='git branch | fzf --preview "git show --color=always {-1}" \
                 --bind "enter:become(git checkout {-1})" \
                 --height 40% --layout reverse'

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

PATH="/home/datpc/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/datpc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/datpc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/datpc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/datpc/perl5"; export PERL_MM_OPT;
