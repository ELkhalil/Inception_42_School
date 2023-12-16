FROM    debian:bullseye

RUN     apt update -y && apt upgrade -y \
        && apt install mariadb-server -y

RUN     rm -rf /etc/mysql/my.cnf
COPY    conf/my.cnf /etc/mysql/

ENV     MYSQL_DATABASE_NAME mydatabase
ENV     MYSQL_ROOT_USER aelkhali
ENV     MYSQL_ROOT_PASSWORD abdo4321
ENV     MYSQL_USER abdo
ENV     MYSQL_PASSWORD 123456


COPY    tools/setup_db.sh .
RUN     chmod 777 setup_db.sh

CMD     [ "sh", "setup_db.sh"]
