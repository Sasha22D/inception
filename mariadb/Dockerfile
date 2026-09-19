FROM debian:bookworm

RUN apt-get update && apt-get install mariadb-server mariadb-client -y

RUN service mariadb start

CMD ["mysqld_safe"]
