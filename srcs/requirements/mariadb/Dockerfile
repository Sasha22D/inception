FROM debian:bookworm

WORKDIR /app

RUN apt-get update && apt-get install mariadb-server mariadb-client -y

COPY entry.sh . 

RUN chmod +x entry.sh

COPY conf/50-server.cnf .

RUN mkdir -p /var/run/mysqld

RUN chown mysql:mysql /var/run/mysqld

ENTRYPOINT ["./entry.sh"]

CMD ["mysqld"]
