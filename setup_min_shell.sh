#!/bin/bash

MY_HOME=$(cd $(dirname $0) && pwd)

setting_for_bash() {
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
  PS1="\u@\h:[\W]# "
fi

alias df='df -h'
alias mkdir='mkdir -p'
EOS
  	echo "Append minimal settings of the $HOME/.bashrc"
  fi
}

setting_for_zsh() {
  if ! grep "Minimal Settings" $HOME/.zshrc > /dev/null; then
	  cat << EOS >> $HOME/.zshrc
#
# Minimal Settings
#
export EDITOR="vi"

#
# history
#
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=40000
export SAVEHIST=60000
setopt hist_ignore_dups   # 重複は記録しない
setopt share_history      # ターミナル間でヒストリを共有する(便利)
setopt hist_reduce_blanks # 余分な空白は詰めて記録
setopt extended_history   # HISTFILEに時間も記録

# bind
if [ "\$PS1" != "" ]; then
  bindkey '^P' history-beginning-search-backward
  bindkey '^N' history-beginning-search-forward
  setopt prompt_subst
  PS1='%n@%m:[%1d]\$ '
fi

alias df='df -h'
alias mkdir='mkdir -p'
EOS
	  echo "Append minimal settings of the $HOME/.zshrc"
  fi
}


RUNNING_SHELL=$(basename $SHELL)
if test "$RUNNING_SHELL" = "bash"; then
  [ ! -f $HOME/.bashrc ] && touch $HOME/.bashrc
  setting_for_bash

elif test "$RUNNING_SHELL" = "zsh"; then
  [ ! -f $HOME/.zshrc ] && touch $HOME/.zshrc
  setting_for_zsh
fi

