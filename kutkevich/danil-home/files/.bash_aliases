# This file is part of Danil Kutkevich <danil@kutkevich.org> home.

# Set PATH so it includes user's private bin if it exists.
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# Tab completion
# <http://en.gentoo-wiki.com/wiki/TAB-Completion#Installation>.
[[ -f /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

export EDITOR="/usr/bin/emacsclient -t"
export ALTERNATE_EDITOR="/usr/bin/emacs"
export PAGER="/usr/bin/less -I"
export HISTSIZE=1000
export HISTCONTROL=ignoredups
# See /usr/share/terminfo/*/
#export TERM=rxvt-256color
#export GIT_PAGER=""

# Aliases.
alias ec='/usr/bin/emacsclient -t'

# RVM (Ruby Version Manager)
# <http://rvm.beginrescueend.com/rvm/install/>.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
