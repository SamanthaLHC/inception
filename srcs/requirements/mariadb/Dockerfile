FROM debian:buster

RUN apt update -y && apt -y install mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld

RUN chown -R mysql:root /run/mysqld && chown -R mysql:mysql /var/lib/mysql

COPY mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY launch_mdb.sh /launch_mdb.sh

COPY ../../requirements/../../srcs/.env /.env

ENTRYPOINT ["bash", "/launch_mdb.sh"]

CMD ["mysqld"]