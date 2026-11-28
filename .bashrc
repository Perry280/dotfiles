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

export HISTCONTROL=erasedups
export HISTSIZE=500
export HISTFILESIZE=500

alias ls='ls -hF --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias less='less --use-color'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias rm='rm -i --preserve-root=all'
alias open='handlr open'
alias chmod='chmod --preserve-root'
alias run0='run0 --background='

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

if [ "$TERM" != "linux" ]; then
    eval "$(starship init bash)"

    if command -v hyprshutdown > /dev/null 2>&1; then
        alias hlsd="hyprshutdown -t 'Shutting down...' --post-cmd 'systemctl poweroff'"
        alias hlrb="hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'"
    fi
fi
