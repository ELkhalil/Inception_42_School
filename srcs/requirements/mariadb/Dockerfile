FROM debian:bullseye

RUN apt-get update && apt-get install mariadb-server -y

COPY tools/create_db.sh .

RUN chmod 755 create_db.sh

CMD [ "sh", "create_db.sh"]
