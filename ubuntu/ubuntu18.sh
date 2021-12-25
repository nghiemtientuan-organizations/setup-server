#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Check ubuntu support version  #'
echo '#---------------------------------------------------#'
echo [Notify] Ubuntu version: $(lsb_release -rs)
if [[ $(lsb_release -rs) == "18."* ]]; then
    echo [Notify] Compatible ubuntu version
else
    echo [Error] Non-compatible ubuntu version
    exit 1
fi

#----- FUNCTION Install window dependency -----#
source ./core/updateWindow.sh
source ./core/base.sh

#----- FUNCTION Install docker and docker-compose -----#
read -p '[Question] Install docker & docker-compose (y/n)?' docker_answer
case ${docker_answer:0:1} in
    y|Y|yes|YES|Yes )
        sourse ./core/docker.sh
    ;;
esac
