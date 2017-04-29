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
./dotsetup.sh
./xxenv_setup.sh

# zsh
sudo vi /etc/shells
chpass -s /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

### vim

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Launch vim and run :PluginInstall

```
