#! /bin/sh
polkit-dumb-agent &
picom &
numlockx &
polybar openbox &
conky &
$HOME/.config/openbox/scripts/xset-screen-blanking.sh &
$HOME/.config/openbox/scripts/keyboard-settings.sh &
redshift-gtk -l 47.7511:-120.7401 -t 5600:3400 &
nm-applet &
variety &
