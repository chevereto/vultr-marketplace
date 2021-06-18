#!/usr/bin/env bash

set -e

. ./chevereto

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[. / 0]}")" &>/dev/null && pwd)"
WORKING_DIR="/var/www/html"
CHEVERETO_SOFTWARE=${SOFTWARE_CHEVERETO}
CHEVERETO_TAG=${SOFTWARE_TAG}
CHEVERETO_INSTALLER_TAG=${SOFTWARE_INSTALLER_TAG}
CHEVERETO_LICENSE=

. ./scripts/00-update.sh
. ./scripts/01-fs.sh
. ./scripts/10-php.sh
. ./scripts/11-installer.sh
. ./scripts/12-apache.sh
. ./common/scripts/03-force-ssh-logout.sh
. ./common/scripts/90-cleanup.sh
. ./scripts/99-apache-reload.sh

echo "[OK] Installer $SOFTWARE_INSTALLER_TAG provisioned"
