#!/bin/sh
mkdir -p ~/.config/qtile

for f in `find . -regex ".*\.sh$\|.*\.py$"`; do
    if [[ "$(basename $f)" != "$(basename $0)" ]]; then
        rm -rf ~/.config/qtile/$f
        ln -s ~/Dev/configs/.config/qtile/$f ~/.config/qtile/$f
    fi
done

