#!/usr/bin/sh

FONTS_DIR="$HOME/.local/share/fonts"

if [ ! -d "$FONTS_DIR" ]; then
	mkdir -p "$FONTS_DIR"
fi

roboto_mono_file="$HOME/Downloads/RobotoMono.zip"
[ -f "$roboto_mono_file" ] \
	|| wget -O "$roboto_mono_file" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip
unzip -d "$FONTS_DIR/RobotoMono" "$roboto_mono_file"

jetbrains_mono_file="$HOME/Downloads/JetBrainsMono.zip"
[ -f "$jetbrains_mono_file" ] \
	|| wget -O "$jetbrains_mono_file" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip -d "$FONTS_DIR/JetBrainsMono" "$jetbrains_mono_file"

rm "$roboto_mono_file"
rm "$jetbrains_mono_file"
