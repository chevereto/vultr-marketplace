#!/usr/bin/env bash

echo $(date -u) ": System provisioning started." >>/var/log/per-instance.log

WORKING_DIR="/var/www/html"
MYSQL_ROOT_PASS=$(openssl rand -hex 16)
DEBIAN_SYS_MAINT_MYSQL_PASS=$(openssl rand -hex 16)

CHEVERETO_DB_HOST=localhost
CHEVERETO_DB_PORT=3306
CHEVERETO_DB_NAME=chevereto
CHEVERETO_DB_USER=chevereto
CHEVERETO_DB_PASS=$(openssl rand -hex 16)

cat >/root/.mysql_password <<EOM
MYSQL_ROOT_PASS="${MYSQL_ROOT_PASS}"
EOM

mysql -u root -e "CREATE DATABASE $CHEVERETO_DB_NAME;"
mysql -u root -e "CREATE USER '$CHEVERETO_DB_USER'@'$CHEVERETO_DB_HOST' IDENTIFIED BY '$CHEVERETO_DB_PASS';"
mysql -u root -e "GRANT ALL ON *.* TO '$CHEVERETO_DB_USER'@'$CHEVERETO_DB_HOST';"

mysqladmin -u root -h localhost password $MYSQL_ROOT_PASS

mysql -uroot -p${MYSQL_ROOT_PASS} \
    -e "ALTER USER 'debian-sys-maint'@'localhost' IDENTIFIED BY '$DEBIAN_SYS_MAINT_MYSQL_PASS';"

cat >>/etc/apache2/envvars <<EOM
export CHEVERETO_DB_HOST=${CHEVERETO_DB_HOST}
export CHEVERETO_DB_NAME=${CHEVERETO_DB_NAME}
export CHEVERETO_DB_USER=${CHEVERETO_DB_USER}
export CHEVERETO_DB_PASS=${CHEVERETO_DB_PASS}
export CHEVERETO_DB_PORT=${CHEVERETO_DB_PORT}
EOM

systemctl restart apache2

cat >/etc/mysql/debian.cnf <<EOM
# Automatically generated for Debian scripts. DO NOT TOUCH!
[client]
host     = localhost
user     = debian-sys-maint
password = ${DEBIAN_SYS_MAINT_MYSQL_PASS}
socket   = /var/run/mysqld/mysqld.sock
[mysql_upgrade]
host     = localhost
user     = debian-sys-maint
password = ${DEBIAN_SYS_MAINT_MYSQL_PASS}
socket   = /var/run/mysqld/mysqld.sock
EOM

sed -e '/Match User root/d' \
    -e '/.*ForceCommand.*Chevereto.*/d' \
    -i /etc/ssh/sshd_config

systemctl restart ssh

rm -rf "${WORKING_DIR}"/installer.lock

echo $(date -u) ": System provisioning script is complete." >>/var/log/per-instance.log
