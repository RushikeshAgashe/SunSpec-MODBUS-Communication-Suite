#!/bin/bash

sudo systemctl disable enable-uart-pins.service
sudo rm -rf /usr/bin/enable-uart-pins.sh
sudo rm -rf /lib/systemd/system/enable-uart-pins.service
