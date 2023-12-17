all :
	cd srcs && \
	 docker-compose up --build
creat :
	mkdir -p /Users/aelkhali/data/wordpress && \
	mkdir -p /Users/aelkhali/data/mysql 
setup : creat all

build :
	cd srcs && \
	docker-compose build
down :
	cd srcs && \
	docker-compose down
clean :
	docker system prune -a
removeALL : down
	 docker system prune --all --volumes --force && \
	 rm -drf /Users/aelkhali/data/* &&\
	 docker volume rm srcs_mariadb_data srcs_wordpress_data --force

re : removeALL setup