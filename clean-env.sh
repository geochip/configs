#!/usr/bin/env sh

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Removing $folder"
    stow -t $HOME -D $folder
done

