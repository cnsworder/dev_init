#!/usr/bin/env bash

for SCREEN in $(xrandr | grep "\<connected\>" | grep -v "LVDS" | awk '{print $1}')
do
    OUTPUT=${SCREEN}
    echo "$output to: ${OUTPUT}"
    break
done

xrandr --output ${OUTPUT}  --mode 1600x900 --left-of LVDS-0

#if [[ x"${OUTPUT:0:4}" == x"HDMI" ]]; then
#    echo "xrandr change..."
    #xrandr --output ${OUTPUT}  --mode 1600x900 --rotate right --left-of LVDS-0
    xrandr --output ${OUTPUT}  --mode 1600x900 --left-of LVDS-0
#    #xrandr --output ${OUTPUT}  --mode 800x600 --left-of LVDS-0
#fi
