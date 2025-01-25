#!/bin/bash

WIN_ID=$(swaymsg -t get_tree | jq -r ".. | select(.name? == \"Floating Window - Show Me The Key\") | .id")

swaymsg "[con_id=$WIN_ID]" floating enable
swaymsg "[con_id=$WIN_ID]" sticky enable
