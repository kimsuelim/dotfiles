#!/bin/bash

set -eux

if [ ! -d ~/.rbenv ]; then
  brew install rbenv
  mkdir -p $(rbenv root)
  ln -nfs $PWD/default-gems $(rbenv root)/default-gems
  mkdir -p $(rbenv root)/plugins
  git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

  eval "$(rbenv init -)"

  rbenv install 2.6.4
  rbenv global  2.6.4
  rbenv rehash
fi

if [ ! -d ~/.nodenv ]; then
  brew install nodenv
  mkdir -p $(nodenv root)

  eval "$(rbenv init -)"

  nodenv install 10.16.3
  nodenv global 10.16.3
  npm install -g eslint
  npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
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
