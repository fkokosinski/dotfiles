#!/bin/sh

# get id
id=$(xdpyinfo | grep focus | cut -d " " -f 4)

# get next virtual term pid
cur_pid=$(xprop -id $id | grep PID | cut -d " " -f 3)
next_pid=$(($cur_pid + 1))

# path for newly spawned virtual term
path="/proc/$next_pid/cwd"

# spawn virtual term
ST_PATH=$(realpath $path) st
