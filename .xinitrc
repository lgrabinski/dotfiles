#!/bin/sh
xrandr -s 1920x1080
nitrogen --set-scaled ~/.config/wall.jpg

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
picom &
dunst &
dwmblocks &
#dbus-launch leftwm
exec dwm
