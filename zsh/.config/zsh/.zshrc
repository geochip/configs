#!/bin/sh

# Command history
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Completion
# zstyle :compinstall filename '$ZDOTDIR/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots) # Include hidden files.

source "$ZDOTDIR/zsh-functions"

zsh_add_file "zsh-prompt"

# Environment variables
export EDITOR="nvim"

