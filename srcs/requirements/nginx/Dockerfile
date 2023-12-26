FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y nginx openssl && \
        rm -rf /var/lib/apt/lists/*

COPY    conf/nginx.conf /etc/nginx/conf.d/
COPY    ./tools/generate_tls.sh .
RUN     chmod 777 generate_tls.sh .

ENTRYPOINT      ["bash", "generate_tls.sh"]

CMD     ["nginx", "-g", "daemon off;"]
