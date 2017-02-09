#!/bin/zsh

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ENV VARIABLES
export EDITOR='subl -w'
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Virtual Environment
#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Projects
#source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh

# Owner
export USER_NAME=$(whoami)
#eval "$(rbenv init -)"

# Application settings
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
