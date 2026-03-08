#!/usr/bin/env bash

# remove todos os apps instalados do remote fedora
flatpak uninstall --system --all --delete-data --noninteractive --from fedora || true

# remove o remote fedora
flatpak remote-delete fedora || true
