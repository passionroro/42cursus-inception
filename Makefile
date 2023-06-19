DOCKER = cd srcs && sudo docker-compose

all:
	$(DOCKER) up -d

list:
	docker ps -a
	docker images
	docker network ls

down:
	$(DOCKER) down

prune: down
	docker system prune -a
