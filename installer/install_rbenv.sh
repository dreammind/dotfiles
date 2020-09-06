#!/bin/bash

APT_PKG="autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev"
#ubuntu18 APT_PKG="autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm libgdbm-dev"
YUM_PKG="gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel"

if which rbenv > /dev/null; then
  echo "rbenv already installed."
  exit
elif ! which anyenv > /dev/null; then
  echo "Please install anyenv"
  exit
fi

UNAME=`uname -a`
if echo $UNMAE | grep "Ubuntu" > /dev/null; then
  sudo apt -y install $APT_PKG
elif test -f /etc/redhat-release; then
  sudo yum -y $YUM_PKG
fi

anyenv install rbenv

echo rbenv install $RUBY_VER
rbenv install $RUBY_VER
rbenv global $RUBY_VER

echo "Please exec 'source ~/.bashrc'"
