#!/bin/bash

WIN_ID=$(swaymsg -t get_tree | jq -r '.. | select(.app_id? == "floating_terminal") | .id')

echo "$WIN_ID"

if [ -n "$WIN_ID" ]; then
    SCRATCH_STATE=$(swaymsg -t get_tree | jq -r ".. | select(.id? == $WIN_ID) | .scratchpad_state")
    echo "$SCRATCH_STATE"
    if [ "$SCRATCH_STATE" != "null" ]; then
        swaymsg "[con_id=$WIN_ID]" move to workspace current
    else
        swaymsg "[con_id=$WIN_ID]" move scratchpad
    fi
else
    kitty --class "floating_terminal" &
fi
