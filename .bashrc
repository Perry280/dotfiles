#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GREEN="\[$(tput setaf 2)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"

PS1="${CYAN}\u${WHITE} \W ${GREEN}\$${WHITE} "

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

if [ "$TERM" != "linux" ]; then
    eval "$(starship init bash)"
fi

if command -v hyprshutdown > /dev/null 2>&1; then
    alias hlsd="hyprshutdown -t 'Shutting down...' --post-cmd 'systemctl poweroff'"
    alias hlrb="hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'"
fi
