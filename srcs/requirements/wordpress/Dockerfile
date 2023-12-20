FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y \
        && apt-get install -y wget \
                              php \
                              php-fpm \
                              php-mysql \
                              mariadb-client

RUN     mkdir -p   /var/www/html

WORKDIR /var/www/html

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY    ./tools/setup_wordpress.sh .

RUN     chmod 777 setup_wordpress.sh

ENTRYPOINT      ["setup_wordpress.sh"]

CMD             ["/usr/sbin/php-fpm7.4", "-F"]

# CMD     ["sh", "setup_wordpress.sh"]

