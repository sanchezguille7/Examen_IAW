#!/bin/bash

set -ex

source .env

snap install core
snap refresh core

apt remove certbot

snap install --classic certbot

ln -sf /snap/bin/certbot /usr/bin/certbot 

certbot --apache -m $moodle_wwwroot --agree-tos --no-eff-email -d $moodle_wwwroot --non-interactive