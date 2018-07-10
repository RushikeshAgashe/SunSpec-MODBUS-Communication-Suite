#!/bin/bash

sudo systemctl disable auto-start-web-server.service
sudo rm -rf /usr/bin/auto-start-web-server.sh
sudo rm -rf /lib/systemd/system/auto-start-web-server.service
