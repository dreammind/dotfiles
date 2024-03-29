#!/usr/bin/env bash

MY_HOME=$(cd $(dirname $0) && pwd)


DOT_FILES=".dircolors .curlrc_ubuntu .gemrc .vimrc .vsvimrc .bashrc .ctags .screenrc .gitignore_global .vim/dict/php.dict .pylintrc"

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
source ~/.bashrc

uname=$(uname)
if test -f /etc/issue; then
  if grep -i ubuntu /etc/issue > /dev/null; then
    uname="Ubuntu"
  elif grep -i CentOS /etc/issue > /dev/null; then
    uname="CentOS"
  elif grep -i Redhat /etc/issue > /dev/null; then
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

#
# golang
if which go > /dev/null 2>&1; then
  go get -u github.com/nsf/gocode
  go get -u github.com/davidrjenni/reftools/cmd/fillstruct
  vim +GoInstallBinaries +qall
  ~/.vim/bundle/gocode/vim/update.sh
  ~/.vim/bundle/gocode/vim/symlink.sh
fi

if which pip3 > /dev/null; then
  if ! which pylint > /dev/null; then
    pip3 install pylint
  fi
fi

if ! grep ".bashrc_sub" $HOME/.bashrc > /dev/null; then
  echo "source $MY_HOME/.bashrc_sub" >> $HOME/.bashrc
fi

#
# zsh
#
if ! test -f $HOME/.zshrc; then
  touch $HOME/.zshrc
fi
if ! grep ".zshrc_sub" $HOME/.zshrc > /dev/null; then
  echo "source $MY_HOME/.zshrc_sub" >> $HOME/.zshrc
fi
