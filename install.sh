#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Welcome to TurboSwitcher installer"
sleep 1

cd $SCRIPT_DIR

echo "Copying service files for TurboSwitcher"
sudo cp turbo-switcher.timer turbo-switcher.service /etc/systemd/system/
sudo cp turbo-switcher.sh /usr/local/bin/

echo "Enabling TurboSwitcher"
sudo systemctl daemon-reload
sudo systemctl enable turbo-switcher.timer --now
