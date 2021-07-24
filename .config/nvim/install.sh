#!/bin/sh

error_message="You must specify exactly one argument ('lua' or 'vim')"

if [ $# -ne 1 ]  || ([ $1 != 'vim' ] && [ $1 != 'lua' ]); then
    echo $error_message
    exit 1
fi

directories=()

if [ $1 == 'vim' ]; then
    directories+=('~/.config/nvim/plugin')
elif [ $1 == 'lua' ]; then
    directories+=('~/.config/nvim/lua/config' '~/.config/nvim/lua/lsp')
else
    echo $error_message
    exit 1
fi

echo "Creating directories..."
for d in ${directories[@]}; do
    mkdir -p $d
done
echo

echo "Creating symbolic links..."
for f in `find . -regex ".*\.$1$"`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Dev/configs/.config/nvim/$f ~/.config/nvim/$f

    echo "~/.config/nvim/$f  ->  ~/Dev/configs/.config/nvim/$f"
done

