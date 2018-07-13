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

# for pyenv
#   LANG=C yum -y groupinstall 'Development Tools'
#   yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel -y
# example)
#   $ pyenv install -l 
#   $ pyenv install 3.6.6
#   $ pyenv global 3.6.6
# ex2)
#   $ pip install awscli --upgrade
#   $ aws --version

# anyenv install pyenv
# anyenv install rbenv
# anyenv install ndenv
