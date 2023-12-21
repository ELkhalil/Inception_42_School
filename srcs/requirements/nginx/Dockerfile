FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y nginx openssl && \
        mkdir -p /etc/nginx/ssl && \
        chmod 755 /etc/nginx/ssl && \
        rm -rf /var/lib/apt/lists/*

COPY    tools/abdo.crt /etc/nginx/ssl/
COPY    tools/abdo.key /etc/nginx/ssl/
COPY    conf/nginx.conf /etc/nginx/conf.d/

CMD     ["nginx", "-g", "daemon off;"]


