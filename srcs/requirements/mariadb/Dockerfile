FROM debian:buster

RUN apt-get update

RUN apt-get install -y mariadb-server mariadb-client

COPY mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY launch_mdb.sh /launch_mdb.sh

ENTRYPOINT ["bash", "/launch_mdb.sh"]

EXPOSE 3306