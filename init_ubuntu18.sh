#!/bin/bash

sudo apt install -y openssh-server

sudo perl -p -i.bak -e 's%https?://(?!security)[^ \t]+%http://jp.archive.ubuntu.com/ubuntu/%g' /etc/apt/sources.list


sudo timedatectl set-timezone 'Asia/Tokyo'

sudo apt install -y language-pack-ja
sudo localectl set-locale 'LANG=ja_JP.utf8'


sudo apt install -y manpages-ja manpages-ja-dev

# ホスト名を変更
# vi /etc/cloud/cloud.cfg
# preserve_hostname: true
# hostnamectl set-hostname linux3

# sources.listも更新しないと、色々なパッケージがインストールできない

# network変更
# vi /etc/netplan/50-cloud-init.yaml 
# sudo netplan apply

# virtualbox guest addtional
# apt install gcc make  
# mount /dev/sr0 /mnt
# /mnt/VBoxLinuxAdditions.run 
# reboot

