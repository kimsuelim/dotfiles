#!/bin/bash

set -eux

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
brew upgrade

# Add Repository
brew tap caskroom/fonts

# .dmg
brew cask install iterm2
brew cask install macvim
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install dropbox

# fonts
brew cask install font-fira-code
brew cask install font-hermit
brew cask install font-profontx

# Packages
brew install git
brew install hub
brew install tig
brew install zsh
brew install tmux
brew install reattach-to-user-namespace
brew install neovim/neovim/neovim
brew install ctags
brew install ag
brew install grip

brew install nodenv
brew install jenv
brew install kotlin
brew install crystal-lang
brew install elixir
brew install go
brew install yarn

brew install imagemagick
brew install jpegoptim
brew install optipng
brew install aspell
brew install autoconf
brew install automake
brew install autossh
brew install awscli
brew install cmake
brew install coreutils
brew install findutils
brew install gnu-sed
brew install gnu-tar
brew install gpg
brew install heroku-toolbelt
brew install htop-osx
brew install jq
brew install keychain
brew install libffi
brew install openssl
brew install parallel
brew install percona-toolkit
brew install pkg-config
brew install proctools
brew install pssh
brew install pstree
brew install readline
brew install ssh-copy-id

brew install tree
brew install watch
brew install wget

brew install sqlite
brew install mysql
brew install postgresql
brew install redis
brew install mongodb
brew install elasticsearch@2.4

brew install ngrep
brew install tcpflow
brew install wireshark

# Required java
brew install ec2-api-tools

# dmg 
brew cask install vagrant
brew cask install virtualbox
brew cask install android-studio
brew cask install intellij-idea-ce
brew cask install application-loader
brew cask install macdown
brew cask install imageoptim
brew cask install mplayerx
brew cask install vlc
brew cask install github-desktop
brew cask install gog-galaxy
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install java
brew cask install iina
brew cask install sabaki
brew cask install calibre

# Remove outdated versions
brew cleanup
