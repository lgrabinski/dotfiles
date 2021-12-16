#
# ~/.bashrc
#

[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
[[ ${BLE_VERSION-} ]] && ble-attach

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

#wal -R
. "$HOME/.cache/wal/colors.sh"

# nnn related
export NNN_PLUG='c:fzcd;f:finder;i:imgview;p:preview-tabbed;o:fzopen;w:wallpaper'
export NNN_FIFO='/tmp/nnn.fifo'


# History
export HISTSIZE=100000
