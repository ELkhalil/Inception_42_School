FROM    debian:bullseye

RUN     apt-get update -y \
        && apt-get upgrade -y \
        && apt-get install -y nginx

RUN     mkdir -p /etc/nginx/ssl \
        && apt install openssl

COPY    /conf/nginx.conf /etc/nginx/conf.d/

        # try to run it one time 
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
        -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=BENGUERIR/O=1337/OU=1337/CN=aelkhali.42.fr/UID=aelkhali"

RUN     mkdir -p /var/run/nginx

RUN     chmod 755 /var/www/html

RUN     chown -R www-data:www-data /var/www/html

CMD     [ "nginx", "-g", "daemon off;" ]
