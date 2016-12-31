#!/bin/bash

PACKAGES=""
PACKAGES="vim vim-nox tig $PACKAGES"
PACKAGES="autoconf automake $PACKAGES"
PACKAGES="lv $PACKAGES"

PACKAGES="dnsutils $PACKAGES"
PACKAGES=" $PACKAGES"

# already installed
PACKAGES="python-rpi.gpio $PACKAGES"

for p in $PACKAGES
do
  echo sudo apt-get -y install $p
  sudo apt-get -y install $p
done
