#!/usr/bin/env bash
set -e

git clone --depth 1 https://github.com/Mibea/Hatter.git /tmp/Hatter

mkdir -p /usr/share/icons
cp -r /tmp/Hatter/Hatter /usr/share/icons/

gtk-update-icon-cache /usr/share/icons/Hatter

mkdir -p /etc/skel/.config/gtk-3.0
echo "gtk-icon-theme-name=Hatter" > /etc/skel/.config/gtk-3.0/settings.ini

rm -rf /tmp/Hatter
