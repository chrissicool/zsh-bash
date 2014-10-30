#
# bash compatibility plugin
#
# (C) Copyright 2012, Christian Ludwig
#

# TODO The following bash builtins are not available to zsh:
#      caller, help?, mapfile/readarray

caller() {
	echo "'caller' is not supported."
}

# rewrite 'source' to be more bash friendly
source() {
  alias shopt=':'
  alias _expand=_bash_expand
  alias _complete=_bash_comp
  emulate -L sh
  setopt kshglob noshglob braceexpand

  builtin source "$@"
}

alias .='source'

# use bash completions
autoload -Uz bashcompinit
bashcompinit -i

if [[ -f /etc/bash_completion ]] ; then
	emulate sh -c 'source /etc/bash_completion'
fi
