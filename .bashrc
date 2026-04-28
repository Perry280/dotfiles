#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

CYAN="\[$(tput setaf 4)\]"
GREEN="\[$(tput setaf 2)\]"
WHITE="\[$(tput setaf 7)\]"
PS1="${CYAN}\u${WHITE} \W ${GREEN}\$${WHITE} "

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
