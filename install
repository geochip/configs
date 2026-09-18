#!/usr/bin/env sh

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Installing $folder"
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done

