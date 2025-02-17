#    _    ____
#   / \  | __ )	https://gitlab.com/ifanatical
#  / _ \ |  _ \
# / ___ \| |_) |
#/_/   \_\____/  	

### EXPORT
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups
export EDITOR="nvim"
export VISUAL="code"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically run tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s main
#fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Aliases

quip()
{
	# Check if $1 is populated
	if [ "$1" = "" ]; then
		printf "Please supply network device. Run \"nmcli d\" for a list.\n"
		return 1
	fi
 
	# Check if $1 is real device
	if ! nmcli d sh $1 > /dev/null; then
		return 2
	fi
 
	# Store connection status
	connection=$(nmcli -g GENERAL.CONNECTION d sh "$1")
 
	# Begin output
	printf "Info for "
 
	if [ "$connection" = "" ]; then
		printf "disconnected %s " "$1"
	else
		printf "%s connected via %s " "$1" "$connection"
	fi
 
	printf "on %s\nUsing %s\n\nMac Address:\t%s\nConnection:\t%s\n" "`uname -n`" "`nmcli -v`" "`nmcli -e no -g GENERAL.HWADDR d sh "$1"`" "`nmcli -e no -g GENERAL.STATE d sh "$1"`"
 
 
	# If no connection, exit without printing IPv4/6 info
	if [ "$connection" = "" ]; then
		return 3
	fi
 
	# Output IPv4. If no IPv4, don't detail DNS, DHCP, etc.
	echo -e -n '\n'IPv4 Address:'\t'
	if echo -e "`nmcli -g IP4.ADDRESS d sh $1`" | grep --color=never "."; then
 
		echo -e -n IPv4 Gateway:'\t'
		if ! echo -e "`nmcli -g IP4.GATEWAY d sh $1`" | grep --color=never "."; then
			echo --
		fi
 
		echo -e -n DHCP Provider:'\t'
		if ! echo -e "`nmcli -e no -t -f DHCP4.OPTION c s $connection | grep dhcp_server_identifier | awk '{print $NF}'`" | grep --color=never "."; then
			echo --
		fi
		# precalc # of dns servers before for loop
		dnscount=$(nmcli -e no -f IP4.DNS d sh $1 | wc -l)
 
		if [[ $dnscount = 0 ]]; then
			echo -e IPv4 DNS [1]:'\t'--
		else
			for (( i=1; i<=$dnscount; i++ )); do 
				echo -e IPv4 DNS [$i]:'\t'"`nmcli -e no -f IP4.DNS d sh $1 | awk 'FNR == '$i' {print $NF}'`"
			done
		fi
 
	else
		echo --
	fi
 
	# Output IPv6 in similar fashion to IPv4
	echo -e -n '\n'IPv6 Address:'\t'
	if echo -e "`nmcli -e no -g IP6.ADDRESS d sh $1`" | grep --color=never ":"; then
 
		echo -e -n IPv6 Gateway:'\t'
		if ! echo -e "`nmcli -e no -g IP6.GATEWAY d sh $1`" | grep --color=never ":"; then
			echo --
		fi
 
		# precalc # of dns servers before for loop
		dnscount=$(nmcli -e no -f IP6.DNS d sh $1 | wc -l)
 
		if [[ $dnscount = 0 ]]; then
			echo -e IPv6 DNS [1]:'\t'--
		else
			for (( i=1; i<=$dnscount; i++ )); do 
				echo -e IPv6 DNS [$i]:'\t'"`nmcli -e no -f IP6.DNS d sh $1 | awk 'FNR == '$i' {print $NF}'`"
			done
		fi
 
		routecount=$(nmcli -e no -f IP6.ROUTE d sh $1 | wc -l)
 
		if [[ $routecount = 0 ]]; then
			echo -e IPv6 Route [1]:'\t'--
		else
			for (( i=1; i<=$routecount; i++ )); do
				echo -e IPv6 Route [$i]:'\t'"`nmcli -e no -f IP6.ROUTE d sh $1 | awk 'FNR == '$i' {s=""; for (i=2; i <= NF; i++) s=s $i " "; print s}'`"
			done
		fi
 
	else
		echo --
	fi
}

# Changing "ls" to "exa"
alias ls='exa -alg --color=always --group-directories-first' # my preferred listing
alias la='exa -ag --color=always --group-directories-first'  # all files and dirs
alias ll='exa -lg --color=always --group-directories-first'  # long format
alias lt='exa -aTg --color=always --group-directories-first' # tree listing
alias l.='exa -ag | grep -E "^\."'
alias lD='exa -D --color=always --group-directories-first' # list directories only

# changing cat to utilize bat
alias cat='bat --theme base16'
alias ogcat='/bin/cat'

alias ver='cat /etc/os-release'

alias ..="z .."
alias cd="z"
alias rm="trash"
alias vim="nvim"
alias reboot="systemctl reboot"
alias clear="\clear; source ~/.bashrc"
alias audacity="GDK_BACKEND=x11 audacity"
alias ytdl="yt-dlp -x -f bestaudio"
alias lsdisk='sudo grc fdisk -l'
alias lsblk='grc lsblk'

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias pacinstalled='pacman -Q | cut -f 1 -d " "' # list installed packages without version number
alias yayinstalled='yay -Qm'
alias parinstalled='paru -Qm'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Network commands
alias ip="grc ip"
alias netstat="grc ss -t"
alias ping="grc ping"
alias bt="bpytop"
alias proxmox01="ssh root@proxmox01.bush.local"
alias proxmox02="ssh root@proxmox02.bush.local"
alias proxmox03="ssh root@proxmox03.bush.local"
alias pihole01="ssh fanatical@pihole01.bush.local"
alias pihole02="ssh fanatical@pihole02.bush.local"
alias zabbix="ssh fanatical@zabbix.bush.local"
alias fileserver="ssh fanatical@fileserver.bush.local"
alias mcserver="ssh fanatical@minecraft-server.bush.local"
alias smtpserver="ssh fanatical@smtpserver.bush.local"
alias fanmedia="ssh fanatical@fanmedia-arch.bush.local"

# Games
alias lspdfr="protontricks-launch --appid 271590 --no-bwrap --no-runtime /home/fanatical/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Grand\ Theft\ Auto\ V/RAGEPluginHook.exe"
alias togglefnv="'/drives/sandisk1TB/SteamLibrary/steamapps/common/Fallout New Vegas/toggle_exe.sh'"

#PS1='[\u@\h \W]\$ '

#echo -e "$USER\n@$HOSTNAME" | figlet -c | lolcat
#colorscript --exec square
fastfetch

# starship
eval "$(starship init bash)"

# zoxide
eval "$(zoxide init bash)"

export PATH=$PATH:/home/fanatical/.spicetify
