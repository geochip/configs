#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'

PS1="\[\e[1;32m\][\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;3;34m\]\W\[\e[m\]\[\e[1;32m\]]\$\[\e[m\] "
export PS1


export PATH="$PATH:$HOME/.local/bin"
export EDITOR=nvim
export DOTFILES=$HOME/dev/configs/nvim/.config/nvim
export STOW_FOLDERS="nvim,alacritty,bash,nitrogen,picom,qtile,i3,i3status,awesome,polybar,tmux,conky"

# set -o vi

alias ls=exa
alias grep='grep --color=auto'

# Quartus stuff
# export QSYS_ROOTDIR="/home/geochip/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"
# export PATH="$PATH:$HOME/Applications/intelFPGA_lite/17.1/quartus/bin"

