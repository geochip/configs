#!/bin/sh
picom --xrender-sync-fence &
nitrogen --restore &
dunst &
nm-applet &
# blueman-applet &

script=$(realpath $0)
script_path=$(dirname $script)

sh "$script_path/touchpad.sh"

