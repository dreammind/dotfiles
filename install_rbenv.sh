#!/bin/bash

RUBY_VER="2.2.1"
GEMS="bundler berkshelf chef knife-zero knife-solo serverspec"

APT_PKG="build-essential"

UNAME=`uname -a`
if echo $UNMAE | grep "Ubuntu" > /dev/null; then
  exit_flag=false
  for p in $APT_PKG
  do
    if ! dpkg -l $p > /dev/null; then
      echo "$p not installed. sudo apt-get install $p"
      exit_flag=true
    fi
  done
  if $exit_flag; then
    exit -1
  fi
fi

if ! test -d $HOME/.rbenv; then
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi
if ! grep .rbenv $HOME/.bashrc > /dev/null; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

source ~/.bashrc

install_ruby() {
  echo rbenv install $RUBY_VER
  rbenv install $RUBY_VER
  rbenv global $RUBY_VER
}

# install ruby
if ! test -f ~/.rbenv/shims/ruby; then
  install_ruby
else
  if ~/.rbenv/shims/ruby -v | grep -v $RUBY_VER > /dev/null; then
    install_ruby
  else
    echo "$RUBY_VER already installed."
  fi
fi


run_gem=false
for g in $GEMS
do
  if gem list $g| egrep -v "^$g"; then
    echo gem install --no-ri --no-rdoc $g
    gem install --no-ri --no-rdoc $g
    run_gem=true
  fi
done

if $run_gem; then
  echo "Please exec 'rbenv rehash'"
fi
echo "Please exec 'source ~/.bashrc'"
