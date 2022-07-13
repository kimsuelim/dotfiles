function export_path_if_exists { [[ -d "$1" ]] && export PATH="$1:$PATH" }

export GOPATH=$HOME
export_path_if_exists "$GOPATH/bin"

export ANDROID_HOME="/Users/surimkim/Library/Android/sdk"
export_path_if_exists "$ANDROID_HOME/tools"
export_path_if_exists "$ANDROID_HOME/platform-tools"

export_path_if_exists /opt/homebrew/share/git-core/contrib/workdir
export_path_if_exists /opt/homebrew/share/git-core/contrib/diff-highlight

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
  export_path_if_exists "/usr/local/opt/coreutils/libexec/gnubin"

  # export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  # export RUBY_CONFIGURE_OPTS="--with-readline-dir=/opt/homebrew/opt/readline --with-openssl-dir=/opt/homebrew/opt/openssl@1.1"
fi

export DISABLE_AUTO_TITLE=true
export EDITOR='vi'
export PAGER='less'
export LESS='-R -g -j10 --no-init --quit-if-one-screen'

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

disable r
