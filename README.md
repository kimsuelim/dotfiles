# dotfiles

## Install

### Homebrew

```
xcode-select --install
sudo xcodebuild -license

sudo mkdir /usr/local
sudo chown -R `whoami` /usr/local
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

git clone https://github.com/kimsuelim/dotfiles.git
cd dotfiles

./brewfile.sh
```

### zsh

```
chpass -s /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -fLo ~/.oh-my-zsh/themes/dracula.zsh-theme --create-dirs https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

./dotsetup.sh
./xxenv_setup.sh
```

### tmux
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Add new plugin to ~/.tmux.conf with set -g @plugin '...'
# Press prefix + I (capital I, as in Install) to fetch the plugin.
```

### rbenv

```
git clone git@github.com:sstephenson/rbenv.git ~/.rbenv
ln -nfs ~/dotfiles/default-gems ~/.rbenv/default-gems
mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git@github.com:sstephenson/ruby-build.git
git clone git@github.com:sstephenson/rbenv-default-gems.git
git clone git@github.com:rkh/rbenv-update.git

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# ruby required libssl-dev libreadline6-dev libncurses5-dev libsqlite3-dev
# nokogiri required libxml2-dev libxslt1-dev
rbenv install 2.4.0
rbenv global  2.4.0
rbenv rehash
```

### nvm

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm use --lts

npm install -g cordova
npm install -g gulp
npm install -g bower
npm install -g eslint
npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
```

### Crystal

```
curl -fsSLo- https://raw.githubusercontent.com/samueleaton/sentry/master/install.rb | ruby
```

### Kotlin

```
brew install kotlin
```

### Vim

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Launch vim and :PlugInstall to install plugins.
```

### Sublime Text

```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```
