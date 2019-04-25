#!/bin/bash

MY_HOME=$(cd $(dirname $0) && pwd)

if ! grep "Minimal Settings" $HOME/.bashrc > /dev/null; then
	cat << EOS >> $HOME/.bashrc
#
# Minimal Settings
#
export EDITOR="vi"

HISTCONTROL=erasedups
HISTIGNORE=history:ls:pwd:jobs:fg:exit
HISTSIZE=20000
HISTFILESIZE=40000

# bind
if [ "\$PS1" != "" ]; then
  bind '"\C-p": history-search-backward'
  bind '"\C-n": history-search-forward'
fi

alias df='df -h'
alias mkdir='mkdir -p'
EOS
	echo "Append minimal settings of the $HOME/.bashrc"
fi

