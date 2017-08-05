#!/usr/bin/env bash

MY_HOME=$(cd $(dirname $0) && pwd)


DOT_FILES=".dircolors .curlrc_ubuntu .gemrc .vimrc .bashrc .ctags .screenrc .gitignore_global .vim/dict/php.dict .pylintrc"

if [ ! -d "$HOME/.vim/dict" ]; then
  mkdir -p $HOME/.vim/dict
fi

for file in $DOT_FILES
do
  if [ -f "$MY_HOME/$file" ]; then
    # 一度だけバックアップ
    if [ -f "$HOME/${file}" -a ! -f "$HOME/${file}.ORG" ]; then
      echo "mv -n $HOME/$file $HOME/${file}.ORG"
      mv -n $HOME/$file $HOME/${file}.ORG
    fi

    echo "ln -sf $MY_HOME/$file $HOME/$file"
    ln -sf $MY_HOME/$file $HOME/$file

  fi
done

uname=$(uname)
if test -f /etc/issue; then
  if grep -i ubuntu /etc/issue; then
    uname="Ubuntu"
  elif grep -i CentOS /etc/issue; then
    uname="CentOS"
  elif grep -i Redhat /etc/issue; then
    uname="RedHat"
  fi
fi

if [ "$uname" = "Ubuntu" ]; then
  ln -sf $MY_HOME/.curlrc_ubuntu $HOME/.curlrc
fi

# autojump
if ! which autojump 2>/dev/null; then
  if [ "$uname" = "Darwin" ]; then
    brew install autojump
  elif [ "$uname" = "Ubuntu" ]; then
    sudo apt-get -y install autojump
  elif [ "$uname" = "CentOS" || "$uname" = "RedHat" ]; then
    sudo yum -y install autojump
  fi
fi


# python pip
[ ! -d "$HOME/.pip" ] && mkdir -p $HOME/.pip
[ ! -h "$HOME/.pip/pip.conf" ] && ln -sf $MY_HOME/pip.conf $HOME/.pip/pip.conf

# vimのbundle
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  (cd $HOME/.vim/bundle/Vundle.vim; git pull --rebase)
fi
vim +PluginInstall +qall

if ! which pylint > /dev/null; then
  pip3 install pylint
fi

if ! grep ".bashrc_sub" $HOME/.bashrc; then
  echo "source $MY_HOME/.bashrc_sub" >> $HOME/.bashrc
fi
