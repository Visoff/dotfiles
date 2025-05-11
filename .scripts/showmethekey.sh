#!/bin/bash

showmethekey-gtk -kA &

WIN_PID=$!

sleep 1

WIN_ID=$(swaymsg -t get_tree | jq -r ".. | select(.pid? == $WIN_PID) | .id")

swaymsg "[con_id=$WIN_ID]" floating enable
swaymsg "[con_id=$WIN_ID]" sticky enable
