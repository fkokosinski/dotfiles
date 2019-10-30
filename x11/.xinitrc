#!/bin/sh

# user and system resources paths
user_res=$HOME/.Xresources
sys_res=/etc/X11/xinit/Xresources

# check if system Xresources exists
if [ -f "$sys_res" ]; then
    xrdb -merge "$sys_res"
fi

# check if user Xresources exists
if [ -f "$user_res" ]; then
    xrdb -merge "$user_res"
fi

# set keyboard map
setxkbmap pl

# start window manager
exec /usr/bin/i3
