#    _    ____
#   / \  | __ )	https://gitlab.com/ifanatical
#  / _ \ |  _ \
# / ___ \| |_) |
#/_/   \_\____/  	

### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export ALTERNATE_EDITOR=""                        # setting for emacsclient
export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically run tmux
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s main
#fi

# Paths
export PATH="$HOME/.cargo/bin:$PATH"

# Aliases

# Changing "ls" to "exa"
alias ls='exa -alg --color=always --group-directories-first' # my preferred listing
alias la='exa -ag --color=always --group-directories-first'  # all files and dirs
alias ll='exa -lg --color=always --group-directories-first'  # long format
alias lt='exa -aTg --color=always --group-directories-first' # tree listing
alias l.='exa -ag | grep -E "^\."'

# changing cat to utilize bat
alias cat='bat --theme Nord --paging=never'

alias ..="z .."
alias cd="z"
alias rm="trash"
alias vim="nvim"
alias reboot="systemctl reboot"
alias clear="\clear; source ~/.bashrc"
alias audacity="GDK_BACKEND=x11 audacity"

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages
alias installed='pacman -Q | cut -f 1 -d " "' # list installed packages without version number

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
alias 'ip=ip -c'
alias 'netstat=ss'
alias 'bt=bpytop'

#PS1='[\u@\h \W]\$ '

#echo -e "$USER\n@$HOSTNAME" | figlet -c | lolcat
#colorscript --exec square
neofetch

# starship
eval "$(starship init bash)"

# zoxide
eval "$(zoxide init bash)"
