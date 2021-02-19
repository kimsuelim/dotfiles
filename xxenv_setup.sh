#!/bin/bash

set -eux

if [ ! -d ~/.rbenv ]; then
  brew install rbenv
  mkdir -p $(rbenv root)
  ln -nfs $PWD/default-gems $(rbenv root)/default-gems
  mkdir -p $(rbenv root)/plugins
  git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

  eval "$(rbenv init -)"

  rbenv install 2.6.6
  rbenv global  2.6.6
  rbenv rehash

  # mysql2 gem with mysql@5.7 brew
  bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix openssl)"
fi

if [ ! -d ~/.nodenv ]; then
  brew install nodenv
  mkdir -p $(nodenv root)

  eval "$(rbenv init -)"

  nodenv install 10.19.0
  nodenv global 10.19.0
  npm install -g eslint
  npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
  npm install mjml
  nodenv rehash
fi

# if [ ! -d ~/.nvm ]; then
#   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
#
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#
#   nvm install --lts
#   nvm use --lts
#
#   npm install -g cordova
#   npm install -g gulp
#   npm install -g eslint
# fi
