#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Update and upgrade ubuntu  #'
echo '#---------------------------------------------------#'
sudo apt update -y & apt upgrade -y
echo [Notify][Success] Update and upgrade ubuntu
