
# MacPorts Installer addition on 2010-03-30_at_21:59:25: adding an appropriate PATH variable for use with MacPorts.
#export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH
#eval "$(rbenv init -)"
## Finished adapting your PATH environment variable for use with MacPorts.

#export TERM="xterm-color"
#export CLICOLOR=1export
#LSCOLORS=ExFxCxDxBxegedabagacadalias 
#ls="ls -v"
#alias ll="ls -lv"
#alias linkyt="ssh -i ~/.ssh/id_rsa linkyt@192.168.0.9"
#alias ucloud="ssh -i ~/.ssh/id_rsa deployer@zomoim.com"
#alias home="ssh -i ~/.ssh/id_rsa kimsuelim@surimjin.iptime.org"

alias linkyt="mosh linkyt@192.168.0.9 -- tmux attach"
alias ucloud="mosh deployer@zomoim.com -- tmux attach"
alias home="mosh kimsuelim@surimjin.iptime.org -- tmux attach"

export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
