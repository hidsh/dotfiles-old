#!/bin/bash
#
#   Filename: .bash_profile
#   Last modified: Mon Oct 22 2012 19:09:23 JST
#  
#   note: for mac
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

##
# Your previous /Users/g/.bash_profile file was backed up as /Users/g/.bash_profile.macports-saved_2012-11-06_at_20:42:47
##

# MacPorts Installer addition on 2012-11-06_at_20:42:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
