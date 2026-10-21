#!/usr/bin/env bash
set -euo pipefail

service mariadb start

# === 1. Changer le mot de passe root avec mysqladmin ===
echo "[1/3] Changement du mot de passe root..."

mysqladmin -u root password "${DB_ROOT_PASS}"

# === 2. Désactiver unix_socket pour root ===
echo "[2/3] Désactivation de unix_socket pour root..."

mysql -u root -e "
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PASS}');
FLUSH PRIVILEGES;
"

# === 3. Créer la base de données ===
echo "[3/3] Création de la base de données '${DB_NAME}'..."

mysql -u root -e "
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';
FLUSH PRIVILEGES;
"

echo "Terminé."
echo "  DB   : ${DB_NAME}"
echo ""

service mariadb stop

mv my.cnf /etc/mysql/

exec "$@"
