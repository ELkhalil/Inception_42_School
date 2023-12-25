
# Colors :
GREEN = \033[0;32m
YELLOW = \033[0;33m
RED= \033[0;31m
BLUE = \033[0;34m
STOP = \033[0m

# Commands And Paths:
LOCAL_DATA_PATH = /home/aelkhali/data
COMPOSE_PATH = ./srcs/docker-compose.yml
RM = rm -rdf

all: create_dirs up

create_dirs:
	@echo "$(BLUE)Setting up directories for Docker volumes...$(STOP)"
	@mkdir -p $(LOCAL_DATA_PATH)/mariadb
	@mkdir -p $(LOCAL_DATA_PATH)/wordpress

up:
	@echo "$(GREEN)building images and running containers...$(STOP)"
	@docker-compose -f $(COMPOSE_PATH) up -d

down:
	@echo "$(YELLOW)Stopping docker running containers...$(STOP)"
	@docker-compose -f $(COMPOSE_PATH) down

clean:
	@echo "$(YELLOW)Cleaning up unused Docker resources...$(STOP)"
	@docker system prune -af

clean_networks:
	@echo "$(RED)Deleting Docker Netowrks...$(STOP)"
	@docker network prune -f
fclean: down
	@echo "$(RED)Complete Cleanup. All Docker resources removed....$(STOP)"
	@sudo $(RM) $(LOCAL_DATA_PATH)/*
	@docker system prune --all --volumes --force && \
		docker volume rm mariadb_vol wordpress_vol --force

re : fclean all

.PHONY: all create_dirs up down clean clean_networks fclean re 