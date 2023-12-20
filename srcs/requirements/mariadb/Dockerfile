FROM            debian:bullseye
        
RUN             apt update -y && apt upgrade -y && \
                apt install mariadb-server -y && \
                rm -rf /var/lib/apt/lists/*
        
COPY            conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY            tools/setup_db.sh .
        
RUN             chmod 777 setup_db.sh

ENTRYPOINT      [ "setup_db.sh"]

CMD             [ "mysqld"]
