#!/usr/bin/env bash

OUTPUT=$(xrandr | grep "HDMI-.*" | awk '{print $1}')

echo "$output to: ${OUTPUT}"

if [[ x"${OUTPUT:0:4}" == x"HDMI" ]]; then
    echo "xrandr change..."
    xrandr --output ${OUTPUT}  --mode 1600x900 --rotate right --left-of LVDS-0
fi
