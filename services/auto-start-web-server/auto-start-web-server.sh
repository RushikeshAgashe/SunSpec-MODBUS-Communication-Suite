#!/bin/bash

ip_address=10.76.56.43
port=8000
fport=8001

cd /home/debian/SunSpec-MODBUS-Communication-Suite/sunspec_web_server/ && stunnel4 stunnel/dev_https &
cd /home/debian/SunSpec-MODBUS-Communication-Suite/sunspec_web_server/ && python manage.py runserver $ip_address:$port
cd /home/debian/SunSpec-MODBUS-Communication-Suite/sunspec_web_server/ && HTTPS=on python manage.py runserver $ip_address:$fport

