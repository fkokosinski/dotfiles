if [ "$(tty)" = "/dev/tty1" ]; then
    udiskie &
    exec sway --unsupported-gpu
fi
