#!/bin/bash

if which nodenv > /dev/null; then
  echo "nodenv already installed."
  exit
fi

if ! which anyenv > /dev/null; then
  echo "Please install anyenv. exit"
  exit 1
fi

anyenv install nodenv
