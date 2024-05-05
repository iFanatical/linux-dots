#!/bin/bash
monitor_status=$(xrandr | grep "DP-2-1" | awk '{print $2}')

if [ "$monitor_status" == "connected" ]; then
    xrandr --output eDP-1 --off --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off --output DP-2-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2-2 --off --output DP-2-3 --off
    xrandr --output DP-2-1 --scale 0.9999x0.9999 &
else
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
    xrandr --output eDP-1 --scale 0.9999x0.9999 &
fi
