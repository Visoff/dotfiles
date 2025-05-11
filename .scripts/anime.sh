#!/bin/bash

file=$(fd -tf . "${HOME}/bg/anime" | shuf -n 1)

swaymsg "output * bg ${file} fill"
