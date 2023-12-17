FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y \
        && apt-get install -y wget \
                              unzip \
                              php7.3 \
                              php-fpm \
                              php-mysql \
                              mariadb-client

RUN     wget    https://wordpress.org/wordpress-6.4.2.zip && \
        wget    https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY    ./tools/setup_wordpress.sh .
RUN     chmod 777 setup_wordpress.sh

EXPOSE  9000

CMD     ["sh", "setup_wordpress.sh"]