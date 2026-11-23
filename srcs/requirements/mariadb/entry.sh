#!/usr/bin/env bash
set -euo pipefail

service mariadb start

echo "[1/3] Changement du mot de passe root..."

mysqladmin -u root password "$(cat ${DB_ROOT_PASS_FILE})"

echo "[2/3] Désactivation de unix_socket pour root..."

mysql -u root -e "
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$(cat ${DB_ROOT_PASS_FILE})');
FLUSH PRIVILEGES;
"

echo "[3/3] Création de la base de données '${DB_NAME}'..."

mysql -u root -e "
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
GRANT ALL ON ${DB_NAME}.* TO '${DB_ADMIN}'@'%' IDENTIFIED BY '$(cat ${DB_ADMIN_PASS_FILE})';
CREATE USER IF NOT EXISTS ${DB_USER} IDENTIFIED BY '$(cat ${DB_USER_PASS_FILE})';
FLUSH PRIVILEGES;
"

echo "Terminé."
echo "  DB   : ${DB_NAME}"
echo ""

service mariadb stop

mv 50-server.cnf /etc/mysql/mariadb.conf.d/

exec "$@"
