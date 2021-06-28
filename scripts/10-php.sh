#!/usr/bin/env bash

cat >/etc/php/7.4/apache2/conf.d/chevereto.ini <<EOM
log_errors = On
upload_max_filesize = 50M
post_max_size = 50M
max_execution_time = 30
memory_limit = 512M
EOM
