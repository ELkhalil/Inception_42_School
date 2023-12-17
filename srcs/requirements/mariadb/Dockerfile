FROM    debian:bullseye

RUN     apt update -y && apt upgrade -y \
        && apt install mariadb-server -y

RUN     rm -rf /etc/mysql/my.cnf
COPY    conf/my.cnf /etc/mysql/

COPY    tools/setup_db.sh .
RUN     chmod 777 setup_db.sh

CMD     [ "sh", "setup_db.sh"]
