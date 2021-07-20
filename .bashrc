#
# ~/.bashrc
#

setxkbmap pl

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/.local/bin:$PATH

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# Aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
