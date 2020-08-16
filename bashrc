# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Clear/Add smart card using the opensc libraries
ssh-sc() {
  ssh-add -e /usr/lib64/opensc-pkcs11.so
  ssh-add -s /usr/lib64/opensc-pkcs11.so
}

# Overwrite SSH_AUTH_SOCK to use gpg-agent instead of ssh-agent
ssh-gpg() {
  gpg-agent -q
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
}

# Use ssh auth sock if it exists
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;

export PS1="[\u@\h:\W ]$ "

# Use faster git-prompt. Adds some time to all shell commands, but like 1ms
. ~/.local/share/bash/custom-git-ps1.sh
export PS1='[\u@\h:\W $(__custom_git_ps1)]\$ '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias suntime='~/bin/sunwait -p 30.2672N 97.7431W'
alias xclip='xclip -selection "clipboard"'

alias docker=podman

# Add path for config mount
export PATH=$PATH:/config/bin

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

if [[ -e ~/.cache/wal/sequences ]]; then
  (cat ~/.cache/wal/sequences &)
fi

if [[ -e $(which keychain 2> /dev/null) ]]; then
  eval $(keychain --agents ssh,gpg --eval id_rsa)
fi
