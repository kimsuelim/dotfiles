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

# Customize to your needs...
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/nginx/sbin:/usr/local/share/npm/bin:$PATH
export EDITOR="mvim"

# Use pry
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"

#alias linkyt="ssh -i ~/.ssh/id_rsa linkyt@192.168.0.9"
#alias ucloud="ssh -i ~/.ssh/id_rsa deployer@zomoim.com"
#alias home="ssh -i ~/.ssh/id_rsa kimsuelim@surimjin.iptime.org"

alias linkyt="mosh linkyt@192.168.0.9 -- tmux attach"
alias ucloud="mosh deployer@zomoim.com -- tmux attach"
alias home="mosh kimsuelim@surimjin.iptime.org -- tmux attach"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
