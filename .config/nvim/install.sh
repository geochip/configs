#!/bin/sh
mkdir -p ~/.config/nvim/plugin

for f in `find . -regex ".*\.vim$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Dev/configs/.config/nvim/$f ~/.config/nvim/$f
done

