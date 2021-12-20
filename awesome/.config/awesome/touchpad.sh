#!/bin/sh

device_id=$(xinput list |  awk '/Touchpad/ {print $6}' | awk -F '=' '{print $NF}')

tapping_enabled_id=$(xinput list-props $device_id | awk '/Tapping Enabled \(/ {print $(NF-1)}' | cut -b 2-4)
natural_scrolling_enabled_id=$(xinput list-props $device_id | awk '/Natural Scrolling Enabled \(/ {print $(NF-1)}' | cut -b 2-4)

xinput set-prop $device_id $tapping_enabled_id 1
xinput set-prop $device_id $natural_scrolling_enabled_id 1

