#!/bin/bash

ip_address=10.76.56.42
port=8000

cd /home/debian/SunSpec-MODBUS-Communication-Suite/sunspec_web_server/ && python manage.py runserver $ip_address:$port
