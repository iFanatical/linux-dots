# set variables
# set mozilla environment variable to support Wayland automatically
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORM="wayland;xcb"
	export QT_QPA_PLATFORMTHEME="gtk2"
	export MOZ_ENABLE_WAYLAND=1
	export SDL_VIDEODRIVER=wayland
	export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORM=wayland
	export XDG_CURRENT_DESKTOP=sway
	export XDG_SESSION_DESKTOP=sway
else
	export MOZ_ENABLE_WAYLAND=0
fi

export GTK_THEME=Nordic
export XCURSOR_SIZE=24
export LD_BIND_NOW=1
export GTK_USE_PORTAL=1
export TERM=xterm-256color
# start wayland session
# sway

# start xorg session
#if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
#  exec startx
#fi

# source .bashrc on login via tty or ssh
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Paths
export PATH="$HOME/.cargo/bin:$PATH"
export PF_COL2=1
