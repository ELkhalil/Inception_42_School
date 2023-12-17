#!/bin/bash

# Setup Workdidpress
mkdir -p    /var/www/html
unzip       wordpress-6.4.2.zip -d /var/www/html/
rm  -rf     wordpress-6.4.2.zip

# setup wordpress WP-CLI
chmod +x    wp-cli.phar
mv          wp-cli.phar /usr/local/bin/wp
chown -R    www-data:www-data /var/www/html/wordpress/

wp config create	--allow-root 
                    --dbname=${MYSQL_DATABASE_NAME}
                    --dbuser=${MYSQL_USER}
                    --dbpass=${MYSQL_PASSWORD}
                    --dbhost=mariadb:3306 --path='/var/www/html/wordpress'

wp core install     --allow-root 
                    --url=localhost
                    --title=${WP_SITE_TITLE}
                    --admin_user=${WP_ADMIN}
                    --admin_password=${WP_ADMIN_PASS}
                    --admin_email=${WP_ADMIN_EMAIL} 

wp user create      --allow-root
                    ${WP_USER} ${WP_USER_EMAIL} 
                    --user_pass=${WP_USER_PASS} 
                    --role=subscriber

exec /usr/sbin/php-fpm7.4 -F