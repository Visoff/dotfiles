#!/usr/bin/env bash

CURRENT_GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [[ "$CURRENT_GOV" == "powersave" ]]; then
  sudo cpupower -c all frequency-set -g performance
  NEW_GOV="performance"
else
  sudo cpupower -c all frequency-set -g powersave
  NEW_GOV="powersave"
fi

notify-send "CPU Governor" "Switched to $NEW_GOV mode"
