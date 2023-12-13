#!/bin/bash

set -ex

apt update

#apt upgrade -y

source .env

sudo apt install php php-mysql libapache2-mod-php php-xml php-mbstring php-curl php-zip php-gd php-intl php-soap -y

sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/" /etc/php/8.1/apache2/php.ini
sed -i "s/;max_input_vars = 1000/max_input_vars = 5000/" /etc/php/8.1/cli/php.ini