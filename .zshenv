export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"

function export_path_if_exists { [[ -d "$1" ]] && export PATH="$1:$PATH" }

export GOPATH=$HOME
export_path_if_exists "$GOPATH/bin"
export_path_if_exists "$HOME/.rbenv/bin" && eval "$(rbenv init --no-rehash - zsh)"
export_path_if_exists /usr/local/share/npm/bin && {
  export NODE_PATH="/usr/local/share/npm/lib/node_modules"
}

if [ -d /usr/local/lib/pkgconfig ]; then
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
fi

if type bundle > /dev/null; then
  alias be='bundle exec'
fi

if type hub > /dev/null; then
  eval "$(hub alias -s zsh)"
fi

if [ "Darwin" = "$(uname)" ]; then
  if [ -x /usr/libexec/java_home ]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
    export_path_if_exists "$JAVA_HOME/bin"
  fi

  export_path_if_exists "/usr/local/opt/coreutils/libexec/gnubin"

  export RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/local/opt/readline --with-openssl-dir=/usr/local/opt/openssl"
fi

export ANDROID_HOME="/Users/kimsuelim/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export EDITOR="mvim"
export DISABLE_AUTO_TITLE=true
export EDITOR='vim'
export PAGER='less'
export LESS='-R -g -j10 --no-init --quit-if-one-screen'

# export LANG='ko_KR.UTF-8'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

disable r
