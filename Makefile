LOCAL_DATA_PATH=./srcs/data
DATA_PATH=./srcs/data/mariadb
WORDPRESS_DATA_PATH=./srcs/data/wordpress

COMPOSE_PATH = ./srcs/docker-compose.yml
RM= rm -rf
CR_DIR= mkdir -p

all: create_directories compose_up

create_directories:
	$(CR_DIR) $(DATA_PATH) $(WORDPRESS_DATA_PATH)

compose_up:
	docker-compose up --build -f $(COMPOSE_PATH)

up: 
	docker-compose up -f $(COMPOSE_PATH)

down:
	docker-compose down -f $(COMPOSE_PATH)

prune:
	docker rm -f $$(docker ps -a -q)
	docker rmi -f $$(docker images -aq)
	docker volume rm $$(docker volume ls -q)

wipe : prune
	$(RM) $(LOCAL_DATA_PATH)

.PHONY: all up down prune wipe create_directories compose_up
