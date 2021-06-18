#!/usr/bin/env bash

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
WORKING_DIR="/var/www/html"

. "$PROJECT_DIR/chevereto"

CHEVERETO_SOFTWARE=${SOFTWARE_CHEVERETO}
CHEVERETO_TAG=${SOFTWARE_TAG}
CHEVERETO_INSTALLER_TAG=${SOFTWARE_INSTALLER_TAG}

. "$PROJECT_DIR/scripts/00-update.sh"
. "$PROJECT_DIR/scripts/01-fs.sh"
. "$PROJECT_DIR/scripts/10-php.sh"
. "$PROJECT_DIR/scripts/11-installer.sh"
. "$PROJECT_DIR/scripts/12-apache.sh"
. "$PROJECT_DIR/common/scripts/03-force-ssh-logout.sh"
. "$PROJECT_DIR/common/scripts/90-cleanup.sh"
. "$PROJECT_DIR/scripts/99-apache-reload.sh"

echo "[OK] Installer $SOFTWARE_INSTALLER_TAG provisioned!"
