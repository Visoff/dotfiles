#!/usr/bin/env bash

CURRENT_GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

# Add icons/formatting
if [[ "$CURRENT_GOV" == "performance" ]]; then
  echo "P"
else
  echo "S"
fi
