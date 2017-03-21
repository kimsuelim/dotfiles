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

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# macvim
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# postgresql
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"
alias pg_restart="pg_ctl -D /usr/local/var/postgres restart"

alias zipbob_web="ssh deploy@www.zipbob.net"
alias zipbob_mobile="ssh deploy@m.zipbob.net"
alias zipbob_db="ssh deployer@14.63.184.31"
alias zipbob_intra="ssh ubuntu@intra.zipbob.net"

alias crit="cordova run ios --target='iPhone-6s, 9.3'"
alias ctags_rails="ctags -R --exclude=.git --exclude=log --exclude=frontend/node_modules --exclude=frontend/platforms --exclude=frontend/plugins --exclude=frontend/bower_components *"
