#!/bin/bash

set -eux

if [ ! -d ~/.rbenv ]; then
  brew install rbenv rbenv-build
  mkdir -p $(rbenv root)
  ln -nfs $PWD/default-gems $(rbenv root)/default-gems
  mkdir -p $(rbenv root)/plugins
  git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

  eval "$(rbenv init -)"

  rbenv install 2.6.8
  rbenv global  2.6.8
  ruby -v
  rbenv rehash

  # mysql2 gem with mysql@5.7 brew
  bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix openssl)"
fi

if [ ! -d ~/.nodenv ]; then
  brew install nodenv node-build
  mkdir -p $(nodenv root)

  eval "$(nodenv init -)"

  nodenv install 12.22.3
  nodenv global 12.22.3
  node -v
  npm install mjml
  nodenv rehash
fi
