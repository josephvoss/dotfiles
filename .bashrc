# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias irc='ssh server -t "tmux at -t Chat"'
alias suntime='~/bin/sunwait -p 30.2672N 97.7431W'
alias xclip='xclip -selection "clipboard"'

# base 16

#BASE16_SHELL=$HOME/.config/base16-shell/

#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#export TERMINAL=urxvt256c
#export TERMINAL=gnome-terminal
export TERMINAL='st'


if [ $TERM == 'rxvt-unicode-256color' ]; then
    export PS1="\[\033]0;\w\007\]$PS1"
fi

set bell-style visible

#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#base16_material-darker

set -o vi
bind '"jk":vi-movement-mode'
bind -f ~/.inputrc

(wal -r -t &)

