FROM debian:buster

RUN apt-get update

RUN apt-get install -y mariadb-server mariadb-client

RUN chown -R mysql:mysql /var/lib/mysql

RUN mkdir -p /var/run/mysqld

RUN chown -R mysql:mysql /var/run/mysqld

COPY mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY launch_mdb.sh /launch_mdb.sh

ENTRYPOINT ["bash", "/launch_mdb.sh"]

EXPOSE 3306