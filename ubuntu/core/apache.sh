#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Generate apache  #'
echo '#---------------------------------------------------#'
sudo apt update
sudo apt-get install apache2 -y
sudo ufw allow 'Apache'
sudo ufw allow 80
sudo systemctl start apache2
sudo systemctl reload apache2

echo [Notify][Success] apache 2
