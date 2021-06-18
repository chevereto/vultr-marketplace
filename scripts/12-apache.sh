#!/usr/bin/env bash

chown -R www-data: /var/log/apache2
chown -R www-data: /etc/apache2
chown -R www-data: /var/www

a2enmod rewrite
