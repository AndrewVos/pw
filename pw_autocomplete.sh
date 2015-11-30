#!/usr/bin/env bash
IFS=$'\n\t'

PASSWORDS_FILE=$HOME/passwords.gpg

if [ "$SHELL" = "/bin/bash" ]; then
  function _complete_pw() {
    if [ ! -f $PASSWORDS_FILE ]; then
      COMPREPLY+=(--create-password-file)
      return 0
    fi

    local word=${COMP_WORDS[COMP_CWORD]}

    lines="$(gpg2 --decrypt --quiet $PASSWORDS_FILE | grep "s: ")"
    lines="${lines//s: /}"
    lines=$(echo "$lines" | grep -e "$word")

    COMPREPLY=( $(compgen -W "${lines}") )
    COMPREPLY+=(--change-password)
    COMPREPLY+=(--create-password-file)

    return 0
  }
  complete -F _complete_pw pw
fi
