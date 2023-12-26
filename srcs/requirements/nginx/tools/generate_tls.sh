#!/bin/bash

mkdir -p /etc/nginx/ssl
chmod 755 /etc/nginx/ssl

cd /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout inception.key \
            -out inception.crt -subj "/C=MA/L=BENGUERIR/O=1337/OU=1337/CN=aelkhali.42.fr/UID=aelkhali"

exec "$@"
