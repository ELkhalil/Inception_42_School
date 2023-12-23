FROM            debian:bullseye
        
RUN             apt-get update -y && apt-get upgrade -y && \
                apt-get install mariadb-server -y

COPY            tools/setup_db.sh .
RUN             chmod 777 setup_db.sh

ENTRYPOINT      ["bash", "setup_db.sh"]

CMD             ["mysqld", "--bind_address=0.0.0.0"]
