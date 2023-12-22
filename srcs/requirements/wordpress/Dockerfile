FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y && \
        apt-get install -y wget php7.4 php7.4-fpm php7.4-mysql mariadb-client

RUN     mkdir -p /var/www/html
WORKDIR /var/www/html

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY    ./conf/wp-config.php .
COPY    ./tools/setup_wordpress.sh .

RUN     chmod 777 setup_wordpress.sh

CMD     [ "sh", "setup_wordpress.sh"]
