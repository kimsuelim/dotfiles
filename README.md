# dotfiles

## Install

### Homebrew

```
xcode-select --install
sudo xcodebuild -license accept


# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor

git clone https://github.com/kimsuelim/dotfiles.git
cd dotfiles

./brewfile.sh
```

### zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/dracula/zsh.git
cd zsh
cp -a lib ~/.oh-my-zsh/themes
cp dracula.zsh-theme ~/.oh-my-zsh/themes
#curl -fLo ~/.oh-my-zsh/themes/dracula.zsh-theme --create-dirs https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme

./dotsetup.sh
./xxenv_setup.sh
```

### tmux
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# type this in terminal if tmux is already running
tmux source ~/.tmux.conf

# Add new plugin to ~/.tmux.conf with set -g @plugin '...'
# Press prefix + I (capital I, as in Install) to fetch the plugin.
```

### Vim

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Launch vim and :PlugInstall to install plugins.
```

### rbenv

```
brew install rbenv rbenv-build
mkdir -p $(rbenv root)
ln -nfs $PWD/default-gems $(rbenv root)/default-gems
mkdir -p $(rbenv root)/plugins
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

eval "$(rbenv init -)"

rbenv install 2.6.8
rbenv global  2.6.8
ruby -v
rbenv rehash
```

### nodenv

```
brew install nodenv node-build
mkdir -p $(nodenv root)

eval "$(nodenv init -)"

nodenv install 12.22.3
nodenv global 12.22.3
npm install mjml
node -v
nodenv rehash
```

### jenv

```
brew install jenv
mkdir -p $(jenv root)

eval "$(jenv init -)"

brew cask install java

jenv global 11
jenv rehash
```

### Crystal

```
brew install crystal-lang
```

### Kotlin

```
brew install kotlin
```
