#!/bin/bash
sudo apt update
sudo apt install tinyproxy -y
sudo apt install apache2 -y
sudo ufw allow 8888/tcp
sudo cp tinyproxy/tinyproxy.conf /etc/tinyproxy -f
sudo cp tinyproxy/filter /etc/tinyproxy -f
sudo cp sites/istart.conf /etc/apache2/sites-available/ -f
sudo a2ensite istart.conf
echo "127.0.0.1 istart.net" | sudo tee -a /etc/hosts
tar -xf www/front.tar --overwrite -C /var/www/html
tar -xf www/istart.tar --overwrite -C /var/www/html/istart
sudo systemctl reload apache2
sudo systemctl restart tinyproxy
