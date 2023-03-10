

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

info:
	# docker-compose -f $(SRC_PATH) top
	# systemctl status mariadb.service
	# tail -n 100 /var/log/mariadb/mariadb.log
	ls -la /var/lib/mysql/
	ls -la /var/run/mysqld

list:
	docker-compose -f $(SRC_PATH) ps

clean-data:
	sudo rm -rf ${HOME}/data/mariadb
	sudo rm -rf ${HOME}/data/wordpress

clean: stop clean-data
	docker volume rm srcs_wordpress
	docker volume rm srcs_mariadb
	docker system prune -f -a --volumes

re: clean all

.PHONY: all dirs build start stop restart info list clean-data clean re