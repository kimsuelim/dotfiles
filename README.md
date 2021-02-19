# dotfiles

## Install

### Homebrew

```
xcode-select --install
sudo xcodebuild -license accept

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew doctor

git clone https://github.com/kimsuelim/dotfiles.git
cd dotfiles

./brewfile.sh
```

### zsh

```
# chpass -s /usr/local/bin/zsh
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

### Sublime Text

```
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
```

### rbenv

```
brew install rbenv
mkdir -p $(rbenv root)
ln -nfs $PWD/default-gems $(rbenv root)/default-gems
mkdir -p $(rbenv root)/plugins
git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems

eval "$(rbenv init -)"

rbenv install 2.6.6
rbenv global  2.6.6
rbenv rehash
```

### nodenv

```
brew install nodenv
mkdir -p $(nodenv root)

eval "$(rbenv init -)"

nodenv install 10.19.0
nodenv global 10.19.0
npm install -g eslint
npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
npm install mjml
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

### nvm

```

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

" adds the source line to your profile (~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc).
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm use --lts

npm install -g cordova
npm install -g gulp
npm install -g eslint
npm install -g eslint-config-standard eslint-plugin-standard eslint-plugin-promise eslint-plugin-import eslint-plugin-node
```

### Crystal

```
brew install crystal-lang
```

### Kotlin

```
brew install kotlin
```
