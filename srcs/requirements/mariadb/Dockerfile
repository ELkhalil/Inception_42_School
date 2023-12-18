FROM    debian:bullseye

RUN     apt update -y && apt upgrade -y \
        && apt install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY    tools/setup_db.sh .
RUN     chmod 777 setup_db.sh

CMD     [ "sh", "setup_db.sh"]
