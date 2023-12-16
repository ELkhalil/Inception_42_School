FROM    debian:bullseye

RUN     apt update -y && apt upgrade -y \
        && apt install -y nginx \
        && apt install openssl

RUN     mkdir -p /etc/nginx/ssl \
        && chmod 755 /etc/nginx/ssl

COPY    /tools/abdo.crt /etc/nginx/ssl/
COPY    /tools/abdo.key /etc/nginx/ssl/

COPY    /conf/nginx.conf /etc/nginx/conf.d/

CMD     [ "nginx", "-g", "daemon off;" ]
