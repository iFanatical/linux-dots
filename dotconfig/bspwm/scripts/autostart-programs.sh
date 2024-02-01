# $HOME/.screenlayout/main-layout.sh &
xrandr --output DP-3 --set TearFree on --scale 0.9999x0.9999 &
xrandr --output DP-3 --scale 0.9999x0.9999 &
# polkit-dumb-agent &
# lxpolkit &
# xss-lock --transfer-sleep-lock -- $HOME/.config/i3/scripts/lock.sh &
picom &
udiskie &
numlockx &
polybar bspwm &
conky &
$HOME/.config/bspwm/scripts/xset-screen-blanking.sh &
$HOME/.config/bspwm/scripts/keyboard-settings.sh &
xsetroot -cursor_name left_ptr &
paplay $HOME/.config/i3/audio/windows-vista-startup.mp3 &
# redshift-gtk -l 47.7511:-120.7401 -t 5600:3400 &
nm-applet &
nitrogen --restore &
$HOME/.custom-exes/color-demo-app/cmdemo_script DP-3 1.3 &
copyq &
# kdeconnect-indicator &
steam &
firefox &
discord &
