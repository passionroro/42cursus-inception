DOCKER = sudo docker compose -f ./srcs/docker-compose.yml

all:
	clear
	$(DOCKER) up -d --build

list:
	clear
	docker ps -a
	docker images
	docker network ls
	docker volume ls

down:
	clear
	$(DOCKER) down

clean: down
	docker system prune -a --volumes

re: fclean all

.PHONY: all list down fclean re
