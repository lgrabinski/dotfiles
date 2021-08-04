#
# ~/.bashrc
#

# PATHS
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PATH=$HOME/.local/bin:$PATH

# VARIABLES
export TERMINAL="st"
export EDITOR="nvim"

setxkbmap pl

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias ll='exa -l'
alias la='exa -la'

# Promt
eval "$(starship init bash)"
pfetch

# "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
