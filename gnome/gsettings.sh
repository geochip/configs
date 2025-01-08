#!/usr/bin/env sh

gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface clock-show-seconds 'true'
gsettings set org.gnome.desktop.interface clock-show-weekday 'true'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface enable-hot-corners 'false'
gsettings set org.gnome.desktop.interface enable-animations 'false'
gsettings set org.gnome.desktop.interface show-battery-percentage 'true'

gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"

gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'

gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

gsettings set org.gnome.shell favorite-apps "[]"

gsettings set org.gnome.desktop.wm.keybindings switch-input-source "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "[]"
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>c']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"
gsettings set org.gnome.desktop.wm.keybindings always-on-top "['<Super>g']"

for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

gsettings set org.gnome.desktop.wm.preferences num-workspaces '6'
gsettings set org.gnome.mutter dynamic-workspaces 'false'
gsettings set org.gnome.mutter overlay-key ''
gsettings set org.gnome.shell.app-switcher current-workspace-only 'true'

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>q']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super>w']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super>e']"

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Super>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Super>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Super>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Super>q']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-5 "['<Shift><Super>w']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-6 "['<Shift><Super>e']"

./set_binding 'Launch Kitty' 'kitty' '<Super>t'
