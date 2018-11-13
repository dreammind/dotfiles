#!/bin/bash

sudo apt install -y openssh-server

sudo timedatectl set-timezone 'Asia/Tokyo'

sudo apt install -y language-pack-ja
sudo localectl set-locale 'LANG=ja_JP.utf8'


sudo apt install -y manpages-ja manpages-ja-dev

# apt install gcc make  
# mount /dev/sr0 /mnt
# /mnt/VBoxLinuxAdditions.run 
# reboot
