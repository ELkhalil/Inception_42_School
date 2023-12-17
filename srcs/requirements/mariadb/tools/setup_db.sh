#!/bin/bash

service mariadb start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};"

mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

sleep 5

service mariadb stop

exec mysqld --defaults-file=/etc/mysql/my.cnf
