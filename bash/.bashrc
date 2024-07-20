#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\e[1;32m\][\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;3;34m\]\W\[\e[m\]\[\e[1;32m\]]\$\[\e[m\] "

function add_to_PATH_first() {
    export PATH="$1:$PATH"
}

## BASH HISTORY
# append history entries..
shopt -s histappend
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
HISTSIZE=20000
# Unlimited history file
HISTFILESIZE=
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

export DOTFILES=$HOME/dev/configs/nvim/.config/nvim
export EDITOR=nvim
export STOW_FOLDERS='alacritty,tmux,nvim,bash'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

add_to_PATH_first "$HOME/.local/bin"

alias ls='ls --group-directories-first --color'
alias ll='ls -la'
alias grep='grep --color=auto'
alias diff='diff --color'

source <(fzf --bash)
eval "$(starship init bash)"
