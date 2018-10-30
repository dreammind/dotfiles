#!/bin/bash

if ! test -d ~/.anyenv; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
else
  (cd ~/.anyenv; git pull --rebase)
fi

if ! grep "anyenv init" ~/.bashrc; then
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(anyenv init -)"' >> ~/.bashrc
  echo "Please execute source ~/.bashrc"
fi

