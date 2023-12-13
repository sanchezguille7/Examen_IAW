#!/bin/bash

set -ex

source .env

sudo apt install php php-mysql libapache2-mod-php php-xml php-mbstring php-curl php-zip php-gd php-intl php-soap -y

sudo mkdir -p /var/www/html/phpmyadmin

sudo wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz -O /var/www/html/phpmyadmin/phpmyadmin.tar.gz

sudo tar xzf /var/www/html/phpmyadmin/phpmyadmin.tar.gz -C /var/www/html/phpmyadmin --strip-components=1

sudo rm /var/www/html/phpmyadmin/phpmyadmin.tar.gz