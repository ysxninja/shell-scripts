#!/bin/sh

case "$SHELL" in 
    "$(which bash)") SHELLRC="bash"
        ;;
    "$(which zsh)") SHELLRC="zsh"
        ;;
    "$(which fish)") SHELLRC="fish"
        ;;
esac

$SHELLRC;exit

# eval "$(exec /usr/bin/env -i "${SHELL}" -l -c "export")"
