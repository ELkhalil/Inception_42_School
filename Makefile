LOCAL_DATA_PATH = /home/aelkhali/data
DATA_PATH = /home/aelkhali/data/mariadb
WORDPRESS_DATA_PATH = /home/aelkhali/data/wordpress

COMPOSE_PATH = ./srcs/docker-compose.yml
RM = rm -rdf
CR_DIR = mkdir -p

all: create_directories compose_up

create_directories:
	$(CR_DIR) $(DATA_PATH) $(WORDPRESS_DATA_PATH)

compose_up:
	docker-compose -f $(COMPOSE_PATH) up -d --build

up:
	docker-compose -f $(COMPOSE_PATH) up -d

down:
	docker-compose -f $(COMPOSE_PATH) down

clean: down
	docker rm $$(docker ps -aq) -f
	docker rmi $$(docker images -aq) -f
	docker volume rm $$(docker volume ls -q)
	docker network prune -f

fclean:
	sudo $(RM) $(LOCAL_DATA_PATH)/*
	docker system prune -af

.PHONY: all create_directories compose_up up down clean fclean
