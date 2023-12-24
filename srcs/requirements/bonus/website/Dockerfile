FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y nginx && \
        rm -rf /var/lib/apt/lists/*

RUN     mkdir -p /var/www/html/aelkhali/
COPY    srcs/ /var/www/html/aelkhali/

COPY    conf/nginx.conf /etc/nginx/conf.d/

EXPOSE  1111
CMD     ["nginx", "-g", "daemon off;"]
