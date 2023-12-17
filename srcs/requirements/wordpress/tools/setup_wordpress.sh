#!/bin/bash

# Setup Wordpress
mkdir -p    /var/www/html
unzip       wordpress-6.4.2.zip -d /var/www/html/
rm  -rf     wordpress-6.4.2.zip

# setup wordpress WP-CLI
chmod +x    wp-cli.phar
mv          wp-cli.phar /usr/local/bin/wp
chown -R    www-data:www-data /var/www/html/wordpress/

sleep 10

wp config create	--allow-root \
                    --dbname=$MYSQL_DATABASE_NAME \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

php-fpm --nodaemonize