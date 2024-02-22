#!/usr/bin/env bash

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
WORKING_DIR="/var/www/html"
. "$PROJECT_DIR/chevereto"
. "$PROJECT_DIR/scripts/00-update.sh"
. "$PROJECT_DIR/scripts/01-fs.sh"
. "$PROJECT_DIR/scripts/10-php.sh"
. "$PROJECT_DIR/scripts/11-installer.sh"
. "$PROJECT_DIR/scripts/12-apache.sh"
. "$PROJECT_DIR/common/scripts/14-ufw-apache.sh"
. "$PROJECT_DIR/common/scripts/03-force-ssh-logout.sh"
. "$PROJECT_DIR/common/scripts/90-cleanup.sh" # for snapshots
echo "[OK] Chevereto v$CHEVERETO_TAG ready"
