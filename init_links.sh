#!/usr/bin/env bash

MY_HOME=$(cd $(dirname $0) && pwd)

DOT_FILES=".gemrc .vimrc .bashrc .ctags .screenrc .vim/dict/php.dict"

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

# vimのbundle
if [ ! -d "$HOME/.vim/bundle" ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
  (cd $HOME/.vim/bundle/vundle; git pull --rebase)
fi

grep "source $MY_HOME/.bashrc_sub" $HOME/.bashrc
if [ $? != 0 ]; then
  echo "source $MY_HOME/.bashrc_sub" >> $HOME/.bashrc
fi
