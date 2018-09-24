#!/bin/bash

if which ndenv > /dev/null; then
  echo "ndenv already installed."
  exit
fi

if ! which anyenv > /dev/null; then
  echo "Please install anyenv. exit"
  exit 1
fi

anyenv install ndenv

