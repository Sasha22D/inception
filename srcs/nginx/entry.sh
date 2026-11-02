#!/usr/bin/env bash
set -uoe pipefail

openssl req -x509 \
	-nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/ssl/private/www.sadaniel.42.fr.key \
	-out /etc/ssl/certs/www.sadaniel.42.fr.crt \
	-subj "/CN=www.sadaniel.42.fr"

exec "$@"
