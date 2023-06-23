DOCKER = cd srcs && sudo docker-compose

all:
	clear
	$(DOCKER) up -d

list:
	clear
	docker ps -a
	docker images
	docker network ls
	docker volume ls


down:
	clear
	$(DOCKER) down

images: down
	clear
	$(DOCKER) build wordpress
	$(DOCKER) build nginx
	$(DOCKER) build mariadb

fclean: down
	docker system prune -a --volumes

re: fclean all

.PHONY: all list down images fclean re
