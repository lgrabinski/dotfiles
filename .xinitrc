#!/bin/sh
xrandr -s 1680x1050
#nitrogen --set-scaled ~/wallpapers/famtasy-5701x3899.jpg
wal -R
[[ -f ~/.Xresources ]]  && xrdb -merge -I$HOME ~/.Xresources
picom &
dunst &
dwmblocks &
exec dwm
#exec qtile
#exec dbus-launch leftwm

#wal -i "$(< "$HOME/.cache/wal/wal")"
