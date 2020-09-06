#!/bin/bash
# node install global

if grep -i ubuntu /etc/issue.net > /dev/null; then
  sudo apt install -y nodejs npm
  sudo npm cache clean
  # for  Error: CERT_UNTRUSTED
  # sudo npm config set strict-ssl false
  sudo npm install n -g
  sudo n stable
  sudo ln -sf /usr/local/bin/node /usr/bin/node
  sudo apt purge -y nodejs npm
fi
