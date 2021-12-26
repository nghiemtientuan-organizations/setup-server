#!/bin/bash
echo '#---------------------------------------------------#'
echo '#  Start  #'
echo '#---------------------------------------------------#'
#----- If command error, exit now -----#
set -e
#----- Check permission -----#
if [ $EUID != 0 ]; then
    echo "[Notify] Please run this script as root (sudo source index.sh)!"
    exit 1
fi

#----- FUNCTION check package installed -----#
function packageIsInstalled() {
    dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed"
}

#----- FUNCTION install with ubuntu version -----#
function runInUbuntuVersion() {
    ubuntuVersion=$(lsb_release -rs)
    if [[ $ubuntuVersion == "18."* ]]; then
      source ./ubuntu18.sh
      wait
    elif [[ $ubuntuVersion == "20."* ]]; then
      source ./ubuntu20.sh
      wait
    else
      echo [Error] Non-compatible ubuntu support version
      exit 1
    fi
}

#----- MAIN Check ubuntu -----#
echo '#---------------------------------------------------#'
echo '#  Ubuntu  #'
echo '#---------------------------------------------------#'
if ! package_is_installed "lsb-release"; then
    sudo apt install lsb-release -y
fi
if [[ $(lsb_release -d) == *"Ubuntu"* ]]; then
    echo [Notify] Compatible ubuntu

    runInUbuntuVersion

    echo '#---------------------------------------------------#'
    echo '#  Finish install  #'
    echo '#---------------------------------------------------#'
else
    echo [Error] Non-compatible ubuntu
    exit 1
fi
