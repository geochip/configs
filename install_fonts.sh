#!/usr/bin/sh

FONTS_DIR="$HOME/.local/share/fonts"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

roboto_mono_file="$HOME/Downloads/RobotoMono.zip"
[ -f RobotoMono.zip ] \
	|| wget -O "$roboto_mono_file" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
unzip -d "$FONTS_DIR/RobotoMono" "$roboto_mono_file"

jetbrains_mono_file="$HOME/Downloads/RobotoMono.zip"
[ -f JetBrainsMono.zip ] \
	|| wget -O "$jetbrains_mono_file" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip -d "$FONTS_DIR/JetBrainsMono" "$jetbrains_mono_file"
