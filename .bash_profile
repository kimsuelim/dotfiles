export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH
eval "$(rbenv init -)"
# Finished adapting your PATH environment variable for use with MacPorts.

export TERM="xterm-color"
export CLICOLOR=1export
LSCOLORS=ExFxCxDxBxegedabagacadalias 
ls="ls -v"
alias ll="ls -lv"

# Install the bash-completion package
# and add follow lines
if [ -f `brew --prefix`/etc/bash_completion ]; then
   . `brew --prefix`/etc/bash_completion
fi

# Use pry
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
