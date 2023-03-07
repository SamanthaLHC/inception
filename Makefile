

SRC_PATH = ./srcs/docker-compose.yml

all: start
	# creer des directories pour les volumes
	#add les droits
	#  rule start

build:
	docker-compose -f $(SRC_PATH) build

start: build
	docker-compose -f $(SRC_PATH) up

stop:
	docker-compose -f $(SRC_PATH) down

restart:
	docker-compose -f $(SRC_PATH) restart

info:
	docker-compose -f $(SRC_PATH) top

list:
	docker-compose -f $(SRC_PATH) ps
	# docker-compose -f $(SRC_PATH) ls

clean: stop
	docker system prune -f -a --volumes
	# rm les dir des volumes

.PHONY: all build start stop restart info list clean