FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y \
        && apt-get install -y wget \
                              php7.3 \
                              php-fpm \
                              php-mysql \
                              mariadb-client

COPY    ./tools/setup_wordpress.sh .
RUN     chmod 777 setup_wordpress.sh

CMD     ["sh", "setup_wordpress.sh"]