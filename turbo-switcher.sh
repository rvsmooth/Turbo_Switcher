#!/bin/bash

CHECK_AC=$(cat /sys/class/power_supply/AC0/online)
TURBO="/sys/devices/system/cpu/intel_pstate/no_turbo"

execute_tubo_switcher() {
  if [ "$CHECK_AC" == "1" ]; then
    echo "0" | sudo tee "$TURBO"
    echo "Turbo has been turned on"
  elif
    [ "$CHECK_AC" == "0" ]
  then
    echo "1" | sudo tee "$TURBO"
    echo "Turbo has been turned off"
  else
    echo "Turbo ain't there"
  fi
}

if
  [ ! -e "$TURBO" ]
then
  echo "Incompatible device for Turbo Switcher"
else
  execute_tubo_switcher
fi
