#!/bin/bash

if which nodenv > /dev/null; then
  echo "nodenv already installed."
  exit
fi

if ! which anyenv > /dev/null; then
  echo "Please install anyenv. exit"
  exit 1
fi

anyenv install nodenv

if ! test -f $(anyenv root)/envs/nodenv/default-packages; then
  touch $(anyenv root)/envs/nodenv/default-packages
fi
