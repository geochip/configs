#!/bin/sh

set -eu

FONTS_DIR="$HOME/.local/share/fonts"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

function download_and_unzip() {
	local filename="$1"
	local url="$2"

	filepath="$HOME/Downloads/$filename"
	[ -f "$filepath" ] || wget -O "$filepath" "$url"
	unzip -d "$FONTS_DIR/${filename%.*}" "$filepath"
}

download_and_unzip 'RobotoMono.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip'
download_and_unzip 'JetBrainsMono.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip'
download_and_unzip 'Hack.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip'
download_and_unzip 'LiberationMono.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/LiberationMono.zip'
download_and_unzip 'MartionMono.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/MartianMono.zip'
download_and_unzip 'Noto.zip' 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Noto.zip'
