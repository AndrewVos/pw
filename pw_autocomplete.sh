#!/usr/bin/env bash
IFS=$'\n\t'

PW_PATH=$HOME/.passwords
PASSWORDS_FILE=$PW_PATH/passwords.gpg

if [ "$SHELL" = "/bin/bash" ]; then
  function _complete_pw() {
    local word=${COMP_WORDS[COMP_CWORD]}

    lines="$(gpg2 --decrypt --quiet $PASSWORDS_FILE | grep "s: ")"
    lines="${lines//s: /}"
    lines=$(echo "$lines" | grep "$word")

    COMPREPLY=( $(compgen -W "${lines}") )

    return 0
  }
  complete -F _complete_pw pw
fi
