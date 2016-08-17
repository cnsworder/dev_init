#!/usr/bin/env bash

arg=$1

if [[ $arg == '' ]]; then
    xrandr --output VGA-0 --mode 800x600  --left-of LVDS-0
else
    xrandr --output VGA-1 --auto
fi
