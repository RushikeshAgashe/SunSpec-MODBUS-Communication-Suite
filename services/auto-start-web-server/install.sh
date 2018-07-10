#!/bin/bash

#Auto-start web-server on startup
echo "Please enter the following information to configure the web server"
read -p "IP Address: " ip_address && sudo sed -i '/ip_address=/c\ip_address='$ip_address'' auto-start-web-server.sh 
read -p "Port Number: " port && sudo sed -i '/port=/c\port='$port'' auto-start-web-server.sh
sudo cp auto-start-web-server.sh /usr/bin/
sudo chmod 755 /usr/bin/auto-start-web-server.sh
sudo cp auto-start-web-server.service /lib/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable auto-start-web-server.service

