#!/usr/bin/env bash
set -e

mkdir -p /etc/dconf/db/local.d

cat > /etc/dconf/db/local.d/00-gnome-defaults << 'EOF'

# Interface
[org/gnome/desktop/interface]
icon-theme='Hatter'
clock-show-weekday=true
enable-hot-corners=false

# Windows
[org/gnome/desktop/wm/preferences]
button-layout='appmenu:minimize,maximize,close'

# Dock / favorites apps
[org/gnome/shell]
favorite-apps=['org.gnome.Nautilus.desktop','org.gnome.Settings.desktop','org.gnome.Software.desktop','org.gnome.TextEditor.desktop','org.gnome.Calculator.desktop','org.onlyoffice.desktopeditors.desktop','com.brave.Browser.desktop']

EOF

dconf update
