#!/bin/bash

set -eux

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
brew upgrade

# Add Repository
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap heroku/brew && brew install heroku
# brew tap aws/tap
# brew tap timescale/brew && brew install timescaledb

# dmg
brew install iterm2
brew install google-chrome
brew install visual-studio-code
brew install jetbrains-toolbox

# fonts
brew install font-hurmit-nerd-font
brew install font-mononoki-nerd-font

# Packages
brew install zsh
brew install zsh-completion
brew install zsh-autosuggestions
brew install tmux
brew install tmuxinator
brew install vim
brew install git
brew install gh
brew install hub
brew install tig
brew install ripgrep
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install universal-ctags

# make locally trusted development certificates
brew install mkcert
brew install nss
mkcert -install
mkcert localhost

brew install yarn
brew install puma/puma/puma-dev
brew install ansible
brew install awscli
brew install mvn
brew install kotlin
brew install go
# brew install crystal-lang
# brew install elixir
brew install docker docker-compose docker-machine
brew install fastlane
brew install firebase-cli

# Sqlite
brew install sqlite

# Mysql
# brew install mysql
# brew services start mysql
# brew install mysql@5.7
# brew services start mysql@5.7
# brew link mysql@5.7 --force
# for MySQL, Time zone support must be installed on the server.
# mysql_tzinfo_to_sql /usr/share/zoneinfo | sed -e "s/Local time zone must be set--see zic manual page/local/" | mysql -u root mysql

# psql
brew install libpq
# brew link --force libpq

# Postgresql
# brew install postgresql
# brew services start postgresql
# brew install postgresql@13
# brew services start postgresql@13
# brew link postgresql@13 --force

# Redis
# brew install redis
# brew services start redis

# Elasticsearch
# brew tap elastic/tap
# brew install elastic/tap/elasticsearch-full
# elasticsearch-plugin install analysis-nori
# brew services start elastic/tap/elasticsearch-full

# Packages
brew install vips
# brew install imagemagick
brew install jpegoptim
brew install optipng
brew install autossh
brew install gpg
brew install htop-osx
brew install jq
brew install keychain
brew install libffi
brew install parallel
brew install proctools
brew install pssh
brew install pstree
brew install readline
brew install ssh-copy-id
brew install tree
brew install watch
brew install wget
# brew install ngrep
# brew install tcpflow
# brew install wireshark

# dmg 
brew install iina
brew install dropbox
brew install folx
brew install ngrok
brew install imageoptim
brew install --cask docker
# brew install paw
# brew install google-backup-and-sync
# brew install sublime-text
# brew install macvim
# brew install virtualbox
# brew install vagrant
# brew install gog-galaxy
# brew install macdown
# brew install github
# brew install firefox
# brew install flipper
# brew install mjml

# Remove outdated versions
brew cleanup
