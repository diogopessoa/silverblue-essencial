#!/usr/bin/env bash
set -e

curl -fsSL https://raw.githubusercontent.com/diogopessoa/rpm-ostree-manager/main/install.sh -o /tmp/install-rom.sh
bash /tmp/install-rom.sh
rm -f /tmp/install-rom.sh
