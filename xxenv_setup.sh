#!/bin/bash

set -eux

if [ ! -d ~/.rbenv ]; then
  brew install rbenv ruby-build
  mkdir -p $(rbenv root)
  ln -nfs $PWD/default-gems $(rbenv root)/default-gems
  mkdir -p $(rbenv root)/plugins
  git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

  eval "$(rbenv init -)"

  rbenv install 3.3.1
  rbenv global 3.3.1
  ruby -v
  rbenv rehash
fi

if [ ! -d ~/.nodenv ]; then
  brew install nodenv node-build
  mkdir -p $(nodenv root)

  eval "$(nodenv init -)"

  nodenv install 20.12.2
  nodenv global 20.12.2
  node -v
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

  brew install --cask temurin@17
  jenv add $(/usr/libexec/java_home)
  jenv versions
  jenv global 17.0
  java -version
fi
