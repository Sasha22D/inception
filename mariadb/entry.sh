#!/usr/bin/env bash
set -euo pipefail

service mariadb start

# === 1. Changer le mot de passe root avec mysqladmin ===
echo "[1/3] Changement du mot de passe root..."

mysqladmin -u root password "${DB_ROOT_PASS}"

# === 2. Désactiver unix_socket pour root ===
echo "[2/3] Désactivation de unix_socket pour root..."

mysql -u root -p -e "
ALTER USER 'root'@'localhost'
IDENTIFIED VIA mysql_native_password
"
#USING PASSWORD('${DB_ROOT_PASS}');
#FLUSH PRIVILEGES;


# Si root@127.0.0.1 existe, on le met aussi en mysql_native_password
mysql -u root -p -e "
ALTER USER IF EXISTS 'root'@'127.0.0.1'
IDENTIFIED VIA mysql_native_password
"
#USING PASSWORD('${DB_ROOT_PASS}');


# === 3. Créer la base de données ===
echo "[3/3] Création de la base de données '${DB_NAME}'..."

mysql -u root -p -e "
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
FLUSH PRIVILEGES;
"

echo "Terminé."
echo "  DB   : ${DB_NAME}"
echo ""

service mariadb stop

#mv 50-server.cnf /etc/mysql/mariadb.conf.d/

mv my.cnf /etc/mysql/

exec "$@"
