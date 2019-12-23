#!/bin/zsh

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# ENV VARIABLES
export EDITOR='subl -w'
export PYTHONPATH="$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH"
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
eval 'export PATH="/Users/martin/.rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/usr/local/Cellar/rbenv/1.1.1/libexec/../completions/rbenv.zsh'
command rbenv rehash 2>/dev/null
rbenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}'
