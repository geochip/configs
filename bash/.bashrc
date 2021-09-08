#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\[\e[1;32m\][\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;3;34m\]\W\[\e[m\]\[\e[1;32m\]]\$\[\e[m\] "
export PS1


export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export EDITOR=nvim
export DOTFILES=$HOME/Dev/configs/nvim/.config/nvim
export STOW_FOLDERS="nvim,alacritty,bash,nitrogen,picom,qtile,i3,polybar"

set -o vi

alias luamake=/home/geochip/.cache/nvim/nlua/sumneko_lua/3rd/luamake/luamake

