#!/bin/bash

chmod +x    wp-cli.phar
mv          wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv wp-config-sample.php wp-config.php

sed -i "s|/run/php/php7.4-fpm.sock|9000|1" /etc/php/7.4/fpm/pool.d/www.conf
sed -i "s/database_name_here/$MYSQL_DATABASE_NAME/1" wp-config.php
sed -i "s/username_here/$MYSQL_USER/1" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/1" wp-config.php
sed -i "s/localhost/mariadb/1" wp-config.php

wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_SITE_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --skip-email
wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=subscriber

exec /usr/sbin/php-fpm7.4 -F
