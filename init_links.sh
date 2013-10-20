#!/usr/bin/env bash

MY_HOME=$(cd $(dirname $0) && pwd)

#DOT_FILES=".vimrc .bashrc"
DOT_FILES=".vimrc"

for file in $DOT_FILES
do
  if [ -f "$MY_HOME/$file" ]; then
    # 一度だけバックアップ
    if [ ! -f "$HOME/${file}.ORG" ]; then
      echo "mv $HOME/$file $HOME/${file}.ORG"
      mv $HOME/$file $HOME/${file}.ORG
    fi

    echo "ln -sf $MY_HOME/$file $HOME/$file"
    ln -sf $MY_HOME/$file $HOME/$file

  fi
done
