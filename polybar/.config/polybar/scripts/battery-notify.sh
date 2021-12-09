#!/usr/bin/sh
percent=`cat /sys/class/power_supply/BAT1/capacity`
status=`cat /sys/class/power_supply/BAT1/status`

if [[ "$percent" -le 15 && "$status" == "Discharging" ]]; then
    echo "$percent%"
    notify-send --urgency=critical "Battery low" "Level: $percent%"
    paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
elif [[ "$status" == "Charging" ]]; then
    echo "CH: $percent%"
else
    echo "DIS: $percent%"
fi

