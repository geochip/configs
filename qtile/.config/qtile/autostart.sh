#!/bin/sh
picom --backend glx &
nitrogen --restore &
nm-applet &
fcitx5 -d &
#udiskie &

script=$(realpath $0)
script_path=$(dirname $script)

sh "$script_path/touchpad.sh"

