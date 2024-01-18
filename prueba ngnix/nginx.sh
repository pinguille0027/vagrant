#!/bin/sh
apt update
apt install ssl-cert nginx php-fpm -y
ln -s /etc/nginx/sites-available/blog.asir.lan /etc/nginx/sites-enabled/blog.asir.lan