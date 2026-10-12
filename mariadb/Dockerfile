FROM debian:bookworm

WORKDIR /app

RUN apt-get update && apt-get install mariadb-server mariadb-client -y

COPY conf/50-server.cnf .

COPY entry.sh . 

COPY conf/my.cnf .

ENTRYPOINT ["./entry.sh"]

CMD ["mysqld_safe"]
