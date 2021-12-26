#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Generate nodejs  #'
echo '#---------------------------------------------------#'
sudo apt update
sudo apt install dirmngr -y

while true; do
    read -p '[Question] Select Nodejs Version (12|14|16|17|current)?' node_version
    case ${node_version} in
        12|14|16|17|current )
            curl -sL https://deb.nodesource.com/setup_${node_version}.x | sudo -E bash -
            sudo apt -y install nodejs
        ;;
    esac
done

echo [Notify] nodejs version: $(node -v)
echo [Notify] npm version: $(npm -v)
echo [Notify][Success] Nodejs
