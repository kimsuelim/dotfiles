# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler cap gem git vundle vagrant)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

# make Rails even faster, but will increase its memory footprint
#export RUBY_GC_MALLOC_LIMIT=60000000
#export RUBY_FREE_MIN=200000

# Customize to your needs...
export EDITOR="mvim"
export DISABLE_AUTO_TITLE=true
export ANDROID_HOME=/Users/kimsuelim/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/nginx/sbin:/usr/local/share/npm/bin:$PATH

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# macvim
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# postgresql
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"
alias pg_restart="pg_ctl -D /usr/local/var/postgres restart"

alias zipbob_web="ssh deployer@zipbob.net"
alias zipbob_db="ssh deployer@staging.zipbob.net"
alias zipbob_intra="ssh deployer@staging.zipbob.net"
alias zipbob_staging="ssh deployer@staging.zipbob.net"

alias sopo_web="ssh ubuntu@sopo.zipbob.net"

alias sa2da_web="ssh deploy@sa2da.net"
alias sa2da_elasticsearch="ssh ubuntu@ec2-54-64-117-132.ap-northeast-1.compute.amazonaws.com"

alias quizdang="ssh deploy@quizdang.com"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export NVM_DIR="/Users/kimsuelim/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
