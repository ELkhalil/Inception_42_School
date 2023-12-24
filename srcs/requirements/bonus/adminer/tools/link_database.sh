#!/bin/bash

# mkdir -p /run/php/
service php7.4-fpm start

curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o index.php
chmod 777 index.php

sleep 5
echo "<?php
\$dbServers = array(
    array('host' => '$WP_DB_HOST', 'port' => $MYSQL_PORT, 'driver' => 'mysql', 'username' => '$MYSQL_USER', 'password' => '$MYSQL_PASSWORD', 'name' => '$MYSQL_DATABASE_NAME')
);
\$driver = 'server';
?>" > adminer-config.php

exec "$@"