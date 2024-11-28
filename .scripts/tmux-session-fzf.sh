#!/bin/bash

session=$(tmux ls | fzf)

session_name=${session%%:*}

tmux switch-client -t $session_name

