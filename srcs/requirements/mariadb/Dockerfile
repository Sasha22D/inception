FROM debian:bookworm

WORKDIR /app

RUN apt-get update && apt-get install mariadb-server mariadb-client -y

COPY entry.sh . 

RUN chmod +x entry.sh

COPY conf/50-server.cnf .

ENTRYPOINT ["./entry.sh"]

CMD ["mysqld_safe"]
