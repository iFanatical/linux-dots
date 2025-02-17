export LD_BIND_NOW=1
export GTK_USE_PORTAL=1
export TERM=xterm-256color
export LS_COLORS='di=01;34:fi=00;37:ln=01;36:bd=01;33:ex=01;32'
export XDG_CONFIG_HOME=$HOME/.config
# export MANGOHUD=1
export QT_QPA_PLATFORMTHEME=qt5ct
export XCURSOR_THEME=Breeze
export XCURSOR_SIZE=18
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# start xorg session
#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#  exec startx
#fi

# source .bashrc on login via tty or ssh
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# start Hyprland on login of TTY1
if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    $HOME/hyprland.sh
fi

# Paths
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export PF_COL2=1

export PATH=$PATH:/home/fanatical/.spicetify
