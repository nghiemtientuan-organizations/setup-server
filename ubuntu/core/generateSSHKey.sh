#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Generate SSH key  #'
echo '#---------------------------------------------------#'
while true; do
    read -p '[Question] Email for generate SSH key (string)?' email
    read -p "[Question] Email is ${email} (y/n)?" confirm_email
    case ${confirm_email:0:1} in
        y|Y|yes|YES|Yes )
            ssh-keygen -t rsa -b 4096 -C "$email"
            break
        ;;
    esac
done

echo [Notify][Success] Generate SSH key
