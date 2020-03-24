#!/bin/bash
# Information
#   1) **envとプラグインをアップデート
#      $ anyenv git pull
#   2) インストール済みの**env系のバージョンを確認
#      $ anyenv versions

# for anyenv
if ! test -d ~/.anyenv; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
fi

[ -d ~/.anyenv/plugins ] || mkdir -p ~/.anyenv/plugins

# for anyenv-update
if ! test -d ~/.anyenv/plugins/anyenv-update; then
  git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update
fi

# for anyenv-git
if ! test -d ~/.anyenv/plugins/anyenv-git; then
  git clone https://github.com/znz/anyenv-git.git ~/.anyenv/plugins/anyenv-git
fi

if ! grep "anyenv init" ~/.bashrc > /dev/null; then
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(anyenv init -)"' >> ~/.bashrc
  echo "Please execute source ~/.bashrc"
fi
