#!/bin/bash

service mariadb start

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};"

mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

# exec mysqld # replaces the current shell process with the MariaDB server process.


# Running a process in the foreground allows it to be the main process (PID 1) of the container, 
# which is important for signal handling and ensures that Docker can manage the container's lifecycle effectively. 
# It's also beneficial for logging, as the logs from the process will be directly visible in the container's 
# standard output and standard error streams.

