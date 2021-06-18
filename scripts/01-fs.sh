#!/usr/bin/env bash

cp $PROJECT_DIR/files/etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf
cp $PROJECT_DIR/files/etc/update-motd.d/99-one-click /etc/update-motd.d/99-one-click
mkdir -p /var/lib/cloud/scripts/per-instance/
cp $PROJECT_DIR/files/var/lib/cloud/scripts/per-instance/001_onboot /var/lib/cloud/scripts/per-instance/001_onboot
chmod +x /var/lib/cloud/scripts/per-instance/001_onboot
chmod +x /etc/update-motd.d/99-one-click
