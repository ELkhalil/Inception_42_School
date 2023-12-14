#!bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"

mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';FLUSH PRIVILEGES;"

sleep 1

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';FLUSH PRIVILEGES;"

mysqladmin -u root -p${DB_ROOT} shutdown

exec mysqld_safe --bind_address="0.0.0.0"
