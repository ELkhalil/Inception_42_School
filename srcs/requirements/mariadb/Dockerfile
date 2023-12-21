FROM            debian:bullseye
        
RUN             apt-get update -y && apt-get upgrade -y && \
                apt-get install mariadb-server -y

WORKDIR         /app

COPY            tools/setup_db.sh /app
        
RUN             chmod 777 setup_db.sh

CMD             [ "sh", "/app/setup_db.sh"]
