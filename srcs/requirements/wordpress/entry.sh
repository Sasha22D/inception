#!/usr/bin/env bash
set -euo pipefail

cd /var/www/html/wordpress/

echo "Check si Wordpress est installé"
if [ ! -f wp-includes/version.php ]; then
  wp core download --allow-root
fi

echo "Check si wp-config existe"
if [ ! -f wp-config.php ]; then
  wp config create --allow-root \
    --dbname="$DB_NAME" \
    --dbuser="$DB_ADMIN" \
    --dbpass="$(cat $DB_ADMIN_PASS_FILE)" \
    --dbhost="$DB_HOST"
fi

exec "$@"
