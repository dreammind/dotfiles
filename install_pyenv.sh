#!/bin/bash

if which pyenv > /dev/null; then
  echo "pyenv already installed."
  exit
elif ! which anyenv > /dev/null; then
  echo "Please install anyenv"
  exit
fi

if grep -i ubuntu /etc/issue.net >/dev/null 2>&1; then
  sudo apt -y install autoconf bison build-essential zlib1g-dev libssl-dev libyaml-dev libreadline6-dev libncurses5-dev libsqlite3-dev libbz2-dev libffi-dev tk-dev liblzma-dev
elif test -f /etc/redhat-release >/dev/null 2>&1; then
  LANG=C yum -y groupinstall 'Development Tools'
  yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel libffi-devel -y
fi

anyenv install pyenv
eval "$(anyenv init -)"

# example)
#   $ pyenv install -l
#   $ pyenv install 3.6.6
#   $ pyenv global 3.6.6
# ex2)
#   $ pip install awscli --upgrade
#   $ aws --version

# Install pyenv-virtualenv
if ! test -d $(pyenv root)/plugins/pyenv-virtualenv; then
  git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

if ! grep virtualenv-init ~/.bashrc; then
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
fi

# ex)
#   $ pyenv virtualenv 3.7.3 foo-proj
#   $ cd test
#   $ pyenv local foo-proj
#
#   確認は
#   $ pyenv versions
#
#   削除は
#   $ pyenv uninstall foo-proj


