FROM debian:bookworm

RUN apt-get update -y

RUN apt-get install php8.2-fpm -y

RUN apt-get install wget -y

RUN mkdir -p /var/www/html

RUN cd /var/www/html && wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm latest.tar.gz

COPY wp-config.php /var/www/html/wordpress/

CMD ["php-fpm8.2", "-F"]
