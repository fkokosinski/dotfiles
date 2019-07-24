if [ "$(tty)" = "/dev/tty1" ]; then
    devmon 2>&1 > /dev/null &
    exec startx
fi
