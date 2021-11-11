#
# ~/.bashrc
#

#neofetch

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[38;5;3m\]\u\[$(tput sgr0)\]@\h:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput sgr0)\]>\[$(tput sgr0)\] '
