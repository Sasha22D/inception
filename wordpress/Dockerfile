FROM debian:bookworm

RUN apt-get update -y

RUN apt-get install php8.2-fpm -y

RUN apt-get install wget php8.2-mysql -y

RUN mkdir -p /var/www/html

RUN cd /var/www/html && wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm latest.tar.gz

COPY wp-config.php /var/www/html/wordpress/

COPY www.conf /etc/php/8.2/fpm/pool.d/

CMD ["php-fpm8.2", "-F"]
