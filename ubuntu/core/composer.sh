#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Install Composer  #'
echo '#---------------------------------------------------#'
sudo apt update
sudo apt install php-cli php-mbstring -y
curl -sS https://getcomposer.org/installer -o ~/composer-setup.php

php_version=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")
if [ $php_version == '8.0' ]; then
    #----- Install composer 2 -----#
    sudo php ~/composer-setup.php --2 --install-dir=/usr/local/bin --filename=composer
else
    #----- Install composer 1 -----#
    sudo php ~/composer-setup.php --1 --install-dir=/usr/local/bin --filename=composer
fi

echo [Notify][Success] Composer
