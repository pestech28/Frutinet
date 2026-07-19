#!/bin/bash
sudo apt update
sudo apt install tinyproxy -y
sudo apt install apache2 -y
sudo ufw allow 8888/tcp
sudo cp tinyproxy/tinyproxy.conf /etc/tinyproxy -f
sudo cp tinyproxy/filter /etc/tinyproxy -f
sudo tar -xvf www/front.tar --overwrite -C /var/www/html
sudo mkdir /var/www/html/restore/istart/
sudo mkdir /var/www/html/restore/restore/
sudo mkdir /var/www/html/restore/live/
sudo cp sites/istart.conf /etc/apache2/sites-available/ -f
sudo a2ensite istart.conf
echo "127.0.0.1 istart.net" | sudo tee -a /etc/hosts
sudo tar -xvf www/istart.tar --overwrite -C /var/www/html/istart
sudo cp sites/nintendo.conf /etc/apache2/sites-available/ -f
sudo a2ensite nintendo.conf
echo "127.0.0.1 nintendo.com" | sudo tee -a /etc/hosts
sudo mkdir /var/www/html/restore/nintendo/
sudo tar -xvzf www/restore/nintendo.tar.gz --overwrite -C /var/www/html/restore/nintendo
sudo cp sites/apple.conf /etc/apache2/sites-available/ -f
sudo a2ensite apple.conf
echo "127.0.0.1 apple.com" | sudo tee -a /etc/hosts
sudo mkdir /var/www/html/restore/apple
sudo tar -xvzf www/restore/apple.tar.gz --overwrite -C /var/www/html/restore/apple
sudo systemctl reload apache2
sudo systemctl restart tinyproxy
