if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export QT_QPA_PLATFORM="wayland;xcb"
	export XDG_CURRENT_DESKTOP="sway"
	export MOZ_ENABLE_WAYLAND=1
else
		export MOZ_ENABLE_WAYLAND=0
fi
