#!/usr/bin/env bash

apt update && apt -y upgrade
cd /tmp
wget https://ewr1.vultrobjects.com/cloud_init_beta/cloud-init_universal_latest.deb
apt-get update -y
apt-get install -y /tmp/cloud-init_universal_latest.deb
grep 'vultr' /etc/default/grub
apt install -y apache2 libapache2-mod-php
apt install -y mysql-server
apt install -y php
apt install -y php-{common,cli,curl,fileinfo,gd,imagick,intl,json,mbstring,mysql,opcache,pdo,pdo-mysql,xml,xmlrpc,zip}
apt install -y python3-certbot-apache software-properties-common unzip
