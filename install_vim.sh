#!/bin/bash

lsb_release=$(lsb_release -cs)
if [ "$lsb_release" = "xenial" ]; then
  sudo add-apt-repository -y ppa:jonathonf/vim
  sudo apt update
  sudo apt install -y vim
fi
