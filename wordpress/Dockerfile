FROM debian:bookworm

WORKDIR /app

RUN apt-get update -y

RUN apt-get install php8.2-fpm wget php8.2-mysql -y

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

#COPY wp-config.php /var/www/html/wordpress/

COPY entry.sh .

RUN chmod +x entry.sh

COPY www.conf /etc/php/8.2/fpm/pool.d/

ENTRYPOINT ["./entry.sh"]

CMD ["php-fpm8.2", "-F"]
