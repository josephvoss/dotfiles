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

# This most important line in this whole thing
alias config="git --work-tree=$HOME/ --git-dir=$HOME/.config/config-git/"

set -o vi
bind '"jk":vi-movement-mode'
bind -f ~/.inputrc

# Setup gpg tty
export GPG_TTY=$(tty)
if ! pgrep -x "gpg-agent" > /dev/null; then
  gpg-agent --daemon > /dev/null 2>&1
fi

export TERMINAL='st'
export EDITOR="nvim"

export NVM_DIR="$HOME/.nvm"

# User specific aliases and functions
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias config="git --git-dir=$HOME/.cfg --work-tree=$HOME"
alias suntime='~/.local/bin/sunwait -p 30.2672N 97.7431W'
alias xclip='xclip -selection "clipboard"'
alias docker=podman

set bell-style visible

source "$HOME/.local/share/bash/custom-git-ps1.sh"

export PS1='[\u@\h:\W $(__custom_git_ps1)]\$ '
