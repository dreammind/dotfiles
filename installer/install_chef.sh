#!/bin/bash

GEMS="bundler chef knife-zero knife-solo serverspec"

for gem in $GEMS; do
  if gem list $gem| egrep -v "^$gem"; then
    echo gem install --no-ri --no-rdoc $gem
    gem install --no-ri --no-rdoc $gem
  fi
done

echo "Please exec 'rbenv rehash'"
