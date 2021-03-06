#!/bin/bash

set -eux

git submodule init
git submodule update

for dotfile in .ackrc .editrc .gdbinit .gemrc .gitconfig .gitignore .inputrc .pryrc .railsrc .screenrc .ssh .tigrc .tmux.conf .tmuxinator .toprc .vimrc .zprofile .zshenv .zshrc
do
  if [ -e ~/$dotfile ]; then
    rm -fr ~/$dotfile
  fi
  ln -nfs $PWD/$dotfile ~/$dotfile
done
