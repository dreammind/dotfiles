#!/bin/sh

uname=$(uname)
if [ "$uname" = "Darwin" ]; then
  brew tap homebrew/cask
  brew cask install chromedrive
fi
