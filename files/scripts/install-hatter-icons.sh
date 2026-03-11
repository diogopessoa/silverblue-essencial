#!/usr/bin/env bash
set -e

git clone --depth 1 https://github.com/Mibea/Hatter.git /tmp/Hatter

install -d /usr/share/icons
cp -r /tmp/Hatter/Hatter /usr/share/icons/

gtk-update-icon-cache /usr/share/icons/Hatter || true

rm -rf /tmp/Hatter
