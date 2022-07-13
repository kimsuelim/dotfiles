#!/bin/bash

set -eux

if [ ! -d ~/.rbenv ]; then
  brew install rbenv ruby-build
  mkdir -p $(rbenv root)
  ln -nfs $PWD/default-gems $(rbenv root)/default-gems
  mkdir -p $(rbenv root)/plugins
  git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

  eval "$(rbenv init -)"

  brew install readline
  brew install openssl@1.1
  RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" rbenv install 3.0.3
  rbenv global  3.0.3
  ruby -v
  rbenv rehash

  # mysql2 gem with mysql@5.7 brew
  # bundle config --global build.mysql2 --with-opt-dir="$(brew --prefix openssl)"
fi

if [ ! -d ~/.nodenv ]; then
  brew install nodenv node-build
  mkdir -p $(nodenv root)

  eval "$(nodenv init -)"

  nodenv install 16.13.0
  nodenv global 16.13.0
  node -v
  npm install -g mjml
  nodenv rehash
fi

if [ ! -d ~/.jenv ]; then
  brew install jenv
  mkdir -p $(jenv root)

  eval "$(jenv init -)"
  jenv doctor

  # To make sure JAVA_HOME is set, make sure to enable the export plugin:
  jenv enable-plugin export
  exec $SHELL -l

  brew install temurin8
  jenv add $(/usr/libexec/java_home)
  jenv versions
  jenv global 1.8
  java -version
fi
