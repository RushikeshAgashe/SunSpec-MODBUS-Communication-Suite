#!/bin/bash

#Configure UART pins on startup
sudo cp enable-uart-pins.sh /usr/bin/
sudo chmod 755 /usr/bin/enable-uart-pins.sh
sudo cp enable-uart-pins.service /lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable enable-uart-pins.service

