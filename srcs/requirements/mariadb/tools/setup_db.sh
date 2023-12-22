#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};"

mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';FLUSH PRIVILEGES;"

sleep 1

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT}';FLUSH PRIVILEGES;"

mysqladmin -u root -p${MYSQL_ROOT} shutdown

exec mysqld_safe --bind_address="0.0.0.0"


# exec mysqld # replaces the current shell process with the MariaDB server process.

# Running a process in the foreground allows it to be the main process (PID 1) of the container, 
# which is important for signal handling and ensures that Docker can manage the container's lifecycle effectively. 
# It's also beneficial for logging, as the logs from the process will be directly visible in the container's 
# standard output and standard error streams.

