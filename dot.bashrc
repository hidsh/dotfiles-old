#!/bin/bash
#
#   Filename: .bashrc
#   Last modified: Mon Oct 22 2012 19:09:34 JST
#  
#   note: require ~/.bash_profile on mac
#  

if [ $TERM = "dumb" ]; then
  export PS1="\u@\h \w$"
  # export PS1="\[\e[37;40;1m\]\u@\h \w$\[\e[0m\]"   # white on black
else
  # export PS1="\[\e[35;1m\]\u@\[\e[34;1m\]\h\e[0m:\[\e[0m\]\e[32;1m\w\e[0m$"
  # export PS1="\u@\h \w$"
  export PS1="\[\e[30;47;1m\]\u@\h \w$\[\e[0m\]"  # black on white 
fi
export LANG=ja_JP.UTF-8

# TextMate
#export EDITOR="/usr/local/bin/mate -w"

#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias ls='ls -F'
alias port-update='sudo port -d selfupdate; sudo port -d sync'
#alias rm='/usr/local/bin/rmtrash'
alias repair='diskutil repairPermissions /'
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin      # my script or tools


# gibo
#source ~/bash_completion.d/gibo-completion.bash

# z for bash
source ~/bin/z.sh

# python
export PYTHONSTARTUP=~/.pythonrc


export PATH="/Applications/microchip/xc8/v1.20/bin":$PATH
