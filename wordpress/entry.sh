#!/usr/bin/env bash
set -euo pipefail

cd /var/www/html/wordpress/

echo "Check si Wordpress est installé"
if [ ! -f wp-includes/version.php ]; then
  wp core download --skip-content
fi

echo "Check si wp-config existe"
if [ ! -f wp-config.php ]; then
  wp config create \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_USER_PASS" \
    --dbhost="$DB_HOST"
fi

exec "$@"
