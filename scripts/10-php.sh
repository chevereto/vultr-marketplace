#!/usr/bin/env bash

cat >/etc/php/8.1/apache2/conf.d/chevereto.ini <<EOM
log_errors = On
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 30
memory_limit = 512M
EOM
