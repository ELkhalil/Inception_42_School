FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx \
    php7.4 php7.4-fpm php7.4-mysql \
    php7.4-pgsql php7.4-sqlite3 \
    php7.4-ldap php7.4-xml \
    php7.4-mbstring curl && \
    rm -rf /var/lib/apt/lists/*

RUN     mkdir -p /var/www/html/adminer
WORKDIR /var/www/html/adminer

COPY    conf/nginx.conf /etc/nginx/conf.d/
COPY    ./tools/link_database.sh .
RUN     chmod 777 link_database.sh

EXPOSE 2222

ENTRYPOINT  ["bash", "link_database.sh"]
CMD         ["nginx", "-g", "daemon off;"]