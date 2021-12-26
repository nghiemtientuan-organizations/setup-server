#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Generate Nginx  #'
echo '#---------------------------------------------------#'
sudo apt update
sudo apt-get install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 80
sudo systemctl start nginx
sudo systemctl reload nginx

echo [Notify][Success] Nginx
