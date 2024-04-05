# dotfiles

## Install

### Homebrew

```
xcode-select --install
sudo xcodebuild -license accept


# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/surimkim/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew doctor

git clone https://github.com/kimsuelim/dotfiles.git
cd dotfiles

./brewfile.sh
```

### zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

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
brew install rbenv ruby-build
mkdir -p $(rbenv root)
ln -nfs $PWD/default-gems $(rbenv root)/default-gems
mkdir -p $(rbenv root)/plugins
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

eval "$(rbenv init -)"

rbenv install 3.1.2
rbenv global 3.1.2
ruby -v
rbenv rehash
```

### nodenv

```
brew install nodenv node-build
mkdir -p $(nodenv root)

eval "$(nodenv init -)"

nodenv install 16.16.0
nodenv global 16.16.0
node -v
nodenv rehash
```

### jenv

```
brew install jenv
mkdir -p $(jenv root)

eval "$(jenv init -)"
jenv doctor

# To make sure JAVA_HOME is set, make sure to enable the export plugin:
jenv enable-plugin export
exec $SHELL -l

brew install temurin11
jenv add $(/usr/libexec/java_home)
jenv versions
jenv global 11.0
java -version
```

### Kotlin

```
brew install kotlin
```

### Crystal

```
brew install crystal-lang
```
