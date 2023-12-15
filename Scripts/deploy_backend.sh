#!/bin/bash

set -ex

source .env

mysql -u root <<< "DROP DATABASE IF EXISTS $moodle_db_name"
mysql -u root <<< "CREATE DATABASE $moodle_db_name"
mysql -u root <<< "DROP USER IF EXISTS '$moodle_db_user'@'$ip_cliente_mysql'"
mysql -u root <<< "CREATE USER '$moodle_db_user'@'$ip_cliente_mysql' IDENTIFIED BY '$moodle_db_pass'"
mysql -u root <<< "GRANT ALL PRIVILEGES ON $moodle_db_name.* TO '$moodle_db_user'@'$ip_cliente_mysql'"

systemctl restart mysql