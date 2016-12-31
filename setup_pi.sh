#!/bin/bash

PACKAGES="\
  vim vim-nox tig
  autoconf automake
  dnsutils
  lv
  python-rpi.gpio
"

for p in $PACKAGES
do
  if ! dpkg -l | grep $p > /dev/null; then
    echo sudo apt-get -y install $p
    sudo apt-get -y install $p
  fi
done
