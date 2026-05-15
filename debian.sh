#!/bin/bash
sudo apt update
sudo apt install tinyproxy -y
sudo apt install apache2 -y
sudo ufw allow 8888/tcp
sudo cp tinyproxy.conf /etc/tinyproxy -f
sudo cp filter /etc/tinyproxy -f
sudo systemctl restart tinyproxy
