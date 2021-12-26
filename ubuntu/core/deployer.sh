#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Generate deployer  #'
echo '#---------------------------------------------------#'
curl -L https://deployer.org/deployer.phar -o /usr/local/bin/dep
sudo chmod +x /usr/local/bin/dep

echo [Notify][Success] deployer
