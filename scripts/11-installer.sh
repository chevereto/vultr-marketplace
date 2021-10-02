#!/usr/bin/env bash

rm -rf "${WORKING_DIR}"/*
mkdir -p /chevereto && mkdir -p /chevereto/download
cd /chevereto/download
curl -S -o installer.php -L "https://github.com/chevereto/installer/releases/download/${CHEVERETO_INSTALLER_TAG}/installer.php"
mv -v installer.php "${WORKING_DIR}"/installer.php
touch "${WORKING_DIR}"/installer.lock
cd $WORKING_DIR
