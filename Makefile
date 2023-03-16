

SRC_PATH = ./srcs/docker-compose.yml

all: dirs build start

dirs:
	mkdir -p ${HOME}/data/mariadb
	mkdir -p ${HOME}/data/wordpress

build:
	docker-compose -f $(SRC_PATH) build

start: build
	docker-compose -f $(SRC_PATH) up

stop:
	docker-compose -f $(SRC_PATH) down

restart:
	docker-compose -f $(SRC_PATH) restart

infos:
	# echo "data in /var/lib/mysql"
	# ls -la /var/lib/mysql/
	# ls -la /var/run/mysqld
	echo "INFOS ABOUT CONTAINERS NAMES, STATES AND PORTS:";
	docker-compose -f $(SRC_PATH) ps;
	echo "VOLUMES NAMES:";
	docker volume ls;
	echo "INFOS ABOUT VOLUMES CONFIG:";
	docker volume inspect srcs_mariadb;
	docker volume inspect srcs_wordpress;
	echo "IMAGES LISTS";
	docker image ls;
	echo "DOCKER NETWORK INFOS";
	docker network ls;

clean-data:
	sudo rm -rf ${HOME}/data/mariadb
	sudo rm -rf ${HOME}/data/wordpress

clean: stop clean-data
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker system prune -f -a --volumes

# fclean: 
# 		./fclean.sh

re: clean all

.PHONY: all dirs build start stop restart infos  clean-data clean re