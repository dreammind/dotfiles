#!/bin/bash

if ! which pyenv > /dev/null; then
  echo "pyenv not installed."
  exit
fi

pip3 install awscli --upgrade
