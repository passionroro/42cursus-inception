DOCKER = sudo docker compose -f ./srcs/docker-compose.yml
DATA_FOLDER = /home/rohoarau/data

all: setup
	clear
	$(DOCKER) up -d --build

clean:
	clear
	$(DOCKER) down

fclean: clean
	docker system prune -a --volumes

re: fclean all

list:
	clear
	docker ps -a
	docker images
	docker network ls
	docker volume ls

setup:
	mkdir -p $(DATA_FOLDER)/mariadb
	mkdir -p $(DATA_FOLDER)/wordpress

.PHONY: all clean fclean re list setup
