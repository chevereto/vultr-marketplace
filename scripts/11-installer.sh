#!/usr/bin/env bash

WORKING_DIR="/var/www/html"
CHEVERETO_LICENSE=
rm -rf /var/www/html/*
mkdir -p /chevereto && mkdir -p /chevereto/{download,installer}
cd /chevereto/download
curl -S -o installer.tar.gz -L "https://github.com/chevereto/installer/archive/${CHEVERETO_INSTALLER_TAG}.tar.gz"
tar -xvzf installer.tar.gz
mv -v installer-"${CHEVERETO_INSTALLER_TAG}"/* $WORKING_DIR
cd $WORKING_DIR
chown www-data: $WORKING_DIR -R
