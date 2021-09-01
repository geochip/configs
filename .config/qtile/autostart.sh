#!/bin/sh
picom --xrender-sync-fence &
nitrogen --restore &
nm-applet &

script=$(realpath $0)
script_path=$(dirname $script)

sh "$script_path/touchpad.sh"

