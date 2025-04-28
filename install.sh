#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Welcome to TurboSwitcher installer"
sleep 1

cd $SCRIPT_DIR
sudo cp turbo-switcher.timer /etc/systemd/system/
sudo cp turbo-switcher.sh /usr/local/bin/

echo "Creating systemd service..."
echo "[Unit]
 Description=Enable turbo mode based on ac availability

[Service]
  Type=simple
  ExecStart=/usr/local/bin/turbo-switcher.sh
  User=root
  " | sudo tee /etc/systemd/system/turbo-switcher.service

echo "Enabling turbo-switcher.service"
sudo systemctl daemon-reload
sudo systemctl enable turbo-switcher.timer --now
