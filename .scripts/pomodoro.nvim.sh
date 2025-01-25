#!/bin/bash

DATE=$(date "+%d.%m.%Y")

DAILY_NOTE_PATH="$HOME/Personal/notes/daily/$DATE.md"

mkdir -p "$(dirname "$DAILY_NOTE_PATH")"

touch "$DAILY_NOTE_PATH"

WIN_ID=$(swaymsg -t get_tree | jq -r '.. | select(.app_id? == "pomodoro_nvim_win") | .id')

echo "$WIN_ID"

if [ -n "$WIN_ID" ]; then
    VISIBLE=$(swaymsg -t get_tree | jq -r ".. | select(.id? == $WIN_ID) | .visible")
    if [ "$VISIBLE" == "true" ]; then
        swaymsg "[con_id=$WIN_ID]" move scratchpad
    else
        swaymsg "[con_id=$WIN_ID]" move to workspace current
        swaymsg "[con_id=$WIN_ID]" focus
    fi
else
    kitty --class "pomodoro_nvim_win" -e nvim "+Pomodoro" "$DAILY_NOTE_PATH" &

    TERM_PID=$!

    sleep 1

    WIN_ID=$(swaymsg -t get_tree | jq -r ".. | select(.pid? == $TERM_PID) | .id")
    swaymsg "[con_id=$WIN_ID]" sticky enable
fi

swaymsg "[con_id=$WIN_ID]" floating disable
swaymsg "[con_id=$WIN_ID]" move right
swaymsg "[con_id=$WIN_ID]" resize set width 20 ppt
