#!/bin/bash

#Auto-start web-server on startup
#read -p "Please enter the Device Name:  " device_name && sed -e "\$aDEVICE_NAME='$device_name'" sudo /etc/profile
read -p "Please enter the Device Name:  " device_name
sudo sed -n -i '/DEVICE_NAME/d' /etc/profile.d/define_device_name.sh
sudo sh -c "echo 'DEVICE_NAME=\"'$device_name'\"' >> /etc/profile.d/define_device_name.sh"
sudo sh -c "echo 'export DEVICE_NAME' >> /etc/profile.d/define_device_name.sh" && sudo chmod 755 /etc/profile.d/define_device_name.sh
