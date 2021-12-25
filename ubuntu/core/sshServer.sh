#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Install SSH Server  #'
echo '#---------------------------------------------------#'
sudo apt-get install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ufw allow 22

echo [Notify][Success] Install SSH
