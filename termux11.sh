!/bin/bash

export DISPLAY=:0
termux-x11 :0 &> /dev/null &
startxfce4 &> /dev/null &

am start --user 0 -n com.termux.x11/.MainActivity &>/dev/null
