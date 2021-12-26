#!/bin/bash

echo ''
echo '#---------------------------------------------------#'
echo '#  Install Mysql  #'
echo '#---------------------------------------------------#'
sudo apt install mysql-server -y

# Make sure that NOBODY can access the server without a password
while true; do
    read -s '[Question] Enter password for root:' root_password
    read -s "[Question] Enter confirmation password:" confirm_root_password
    if [ $root_password == $confirm_root_password ]; then
        mysql -e "UPDATE mysql.user SET Password = PASSWORD('${root_password}') WHERE User = 'root'"
        break
    else
        echo [Error] Confirmation password is wrong
    fi
done

# Kill the anonymous users
read -p "[Question] Remove anonymous users (y/n)?" remove_anonymous_users
case ${remove_anonymous_users:0:1} in
    y|Y|yes|YES|Yes )
        mysql -e "DROP USER ''@'localhost'"
    ;;
esac

# Disallow root login remotely
read -p "[Question] Disallow root login remotely (y/n)?" disable_root_login_remotely
case ${disable_root_login_remotely:0:1} in
    y|Y|yes|YES|Yes )
        mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    ;;
esac

# Kill off the demo database
read -p "[Question] Remove test database and access to it (y/n)?" remove_test_database
case ${remove_test_database:0:1} in
    y|Y|yes|YES|Yes )
        mysql -e "DROP DATABASE IF EXISTS test"
    ;;
esac

# Create new user
read -p "[Question] Create a new user (y/n)?" create_new_user
case ${create_new_user:0:1} in
    y|Y|yes|YES|Yes )
        # Enter username
        read -s '[Question] Enter username:' user_name

        # Enter password
        while true; do
            read -s '[Question] Enter password:' user_password
            read -s "[Question] Enter confirmation password:" confirmation_user_password
            if [ $user_password == $confirmation_user_password ]; then
                mysql -e "CREATE USER '${user_name}'@'localhost' IDENTIFIED BY '${user_password}'"
                mysql -e "GRANT ALL PRIVILEGES ON * . * TO '${user_name}'@'localhost'"
                break
            else
                echo [Error] Confirmation password is wrong
            fi
        done

        echo [Notify][Success] Create a new account: $user_name
    ;;
esac

# Create new database
read -p "[Question] Create a new database (y/n)?" create_new_database
case ${create_new_database:0:1} in
    y|Y|yes|YES|Yes )
        read -s '[Question] Enter database name:' new_database_name
        mysql -e "CREATE DATABASE ${new_database_name}"

        echo [Notify][Success] Create a new database: $new_database_name
    ;;
esac

# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"

echo [Notify][Success] Mysql
