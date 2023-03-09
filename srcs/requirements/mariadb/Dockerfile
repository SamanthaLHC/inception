FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y && apt install mariadb-client -y

COPY mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY launch_mdb.sh /launch_mdb.sh

ENTRYPOINT ["bash", "/launch_mdb.sh"]

EXPOSE 3306