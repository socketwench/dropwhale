#!/usr/bin/env bash

set -m
set -e

MYSQL_DB=${MYSQL_DB:-your_db}
MYSQL_USER=${MYSQL_USER:-your_user}
MYSQL_PASS=${MYSQL_PASS:-your_password}

mysqld_safe &

sleep 10

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB}"
mysql -u root -e "GRANT ALL ON ${MYSQL_DB}.* to '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -u root -e "FLUSH PRIVILEGES"

fg
