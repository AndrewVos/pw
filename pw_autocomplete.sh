#!/usr/bin/env bash
# set -euo pipefail
# IFS=$'\n\t'

PASSWORDS_PATH=$HOME/.passwords

if [ "$SHELL" = "/bin/bash" ]; then
  function _complete_pw() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(find $PASSWORDS_PATH -type f -printf "%P\n")
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
  }
  complete -F _complete_pw pw
fi

