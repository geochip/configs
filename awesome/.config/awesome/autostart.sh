#!/bin/sh

run() {
    if [[ $(pgrep $1) ]]; then
        killall $1
    fi

    $@ >> ~/.local/share/autostart_log/autostart.log 2>&1 &
}

#run "picom --backend glx"
#run "nm-applet"
#run udiskie
#run cbatticon

nitrogen --restore &

script=$(realpath $0)
script_path=$(dirname $script)

sh "$script_path/touchpad.sh"

