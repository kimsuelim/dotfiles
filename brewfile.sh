#!/bin/bash

set -eux

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
brew upgrade

# Add Repository
brew tap caskroom/fonts
brew tap aws/tap

# dmg
brew install iterm2
brew install google-chrome
brew install dropbox
brew install docker

# fonts
brew install font-hermit
brew install font-mononoki
brew install font-profontx

# Packages
brew install zsh
brew install tmux
# brew install reattach-to-user-namespace
brew install vim
brew install git
brew install hub
brew install tig
brew install ag
brew install ripgrep
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install grip

brew install nodenv
# brew install jenv
# brew install kotlin
# brew install crystal-lang
# brew install elixir
# brew install go
brew install yarn
# brew install docker docker-compose docker-machine
brew install awscli
brew install aws-sam-cli
brew install ansible
brew install puma/puma/puma-dev

brew install sqlite
brew install mysql
# for MySQL, Time zone support must be installed on the server.
mysql_tzinfo_to_sql /usr/share/zoneinfo | sed -e "s/Local time zone must be set--see zic manual page/local/" | mysql -u root mysql
brew install postgresql
brew install redis
# brew install mongodb
brew install elasticsearch
brew install kibana

brew install vips
brew install imagemagick
brew install jpegoptim
brew install optipng
brew install autoconf
brew install automake
brew install autossh
brew install cmake
brew install coreutils
brew install findutils
brew install gnu-sed
brew install gnu-tar
brew install gpg
brew install htop-osx
brew install jq
brew install keychain
brew install libffi
brew install openssl
brew install parallel
brew install pkg-config
brew install proctools
brew install pssh
brew install pstree
brew install readline
brew install ssh-copy-id

brew install tree
brew install watch
brew install wget
brew install ngrep
brew install tcpflow
brew install wireshark

# dmg 
# brew install java
# brew install virtualbox
# brew install vagrant
# brew install android-studio
# brew install intellij-idea-ce
# brew install application-loader
brew install macdown
brew install imageoptim
brew install iina
# brew install folx
brew install github-desktop
# brew install gog-galaxy
brew install firefox
brew install google-backup-and-sync
# brew cask install sabaki
# brew cask install calibre
# brew install textmate
# brew install sublime-text
brew install macvim
brew install visual-studio-code
brew install postman
brew install mjml

# Remove outdated versions
brew cleanup
