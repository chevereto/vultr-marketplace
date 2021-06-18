#!/usr/bin/env bash

set -e

source chevereto

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
WORKING_DIR="/var/www/html"
CHEVERETO_SOFTWARE=${SOFTWARE_CHEVERETO}
CHEVERETO_TAG=${SOFTWARE_TAG}
CHEVERETO_INSTALLER_TAG=${SOFTWARE_INSTALLER_TAG}
CHEVERETO_LICENSE=

source scripts/00-update.sh
source scripts/01-fs.sh
source scripts/10-php.sh
source scripts/11-installer.sh
source scripts/12-apache.sh
source common/scripts/03-force-ssh-logout.sh
source scripts/99-apache-reload.sh

echo "[OK] Installer $SOFTWARE_INSTALLER_TAG provisioned"
