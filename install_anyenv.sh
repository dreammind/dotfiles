#!/bin/bash

# for anyenv
if ! test -d ~/.anyenv; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
else
  (cd ~/.anyenv; git pull --rebase)
fi

[ -d ~/.anyenv/plugins ] || mkdir -p ~/.anyenv/plugins

# for anyenv-update
if test -d ~/.anyenv/plugins/anyenv-update; then
  (cd ~/.anyenv/plugins/anyenv-update; git pull --rebase)
else
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
fi

if ! grep "anyenv init" ~/.bashrc; then
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(anyenv init -)"' >> ~/.bashrc
  echo "Please execute source ~/.bashrc"
fi
