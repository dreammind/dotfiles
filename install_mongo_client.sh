#!/bin/bash
# ubuntu 20.04 LTS に最新のmongo をインストール

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' > /tmp/mongodb-org-4.2.list
sudo mv /tmp/mongodb-org-4.2.list /etc/apt/sources.list.d/

sudo apt update -y

sudo apt install mongodb-org-tools mongodb-org-shell
