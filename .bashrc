#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\[\e[1;32m\][\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;32m\]\h\[\e[m\] \[\e[1;3;34m\]\W\[\e[m\]\[\e[1;32m\]]\$\[\e[m\] "
