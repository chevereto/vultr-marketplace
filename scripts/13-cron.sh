#!/usr/bin/env bash

(
    crontab -l 2>/dev/null
    echo "* * * * * www-data php /var/www/html/cli.php -C cron"
) | crontab -
