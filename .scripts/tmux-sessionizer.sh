#!/bin/bash

if [[ $# -eq 1 ]]; then
    path=$1
else
    path=$(find ~ -type d -print | fzf)
fi

name=$(basename "$path" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux-running ]]; then
    tmux new-session -s "$name" -c "$path"
    exit 0
fi

if ! tmux has-session -t "$name" 2> /dev/null; then
    tmux new-session -ds "$name" -c "$path"
fi

tmux switch-client -t "$name"
