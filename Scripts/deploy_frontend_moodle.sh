#!/bin/bash

set -ex

source .env

sudo rm -rf /tmp/moodle_4.3.1.zip

wget https://github.com/moodle/moodle/archive/refs/tags/v4.3.1.zip -P /tmp

sudo rm -rf /var/www/html/*

sudo apt install unzip -y

unzip /tmp/moodle_4.3.1.zip -d /var/www/html/

sudo chown www-data:www-data /var/www/html/* -R

mkdir /var/www/moodledata

chmod 0777 /var/www/moodledata

sudo -u www-data php /var/www/html/admin/cli/install.php \
    --lang=$moodle_lang \
    --wwwroot=$moodle_wwwroot \
    --dataroot=$moodle_dataroot \
    --dbtype=$moodle_db_type \
    --dbhost=$moodle_db_host \
    --dbname=$moodle_db_name \
    --dbuser=$moodle_db_user \
    --dbpass=$moodle_db_pass \
    --fullname="$moodle_fullname" \
    --shortname="$moodle_shortname" \
    --summary="$moodle_summary" \
    --adminuser=$moodle_admin_user \
    --adminpass=$moodle_admin_pass \
    --adminemail=$moodle_admin_email \
    --non-interactive \
    --agree-license