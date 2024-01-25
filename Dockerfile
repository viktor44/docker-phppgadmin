FROM php:8.1-apache

ENV POSTGRES_HOST localhost1
ENV POSTGRES_PORT 5432
ENV PORT 80

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions \
       && install-php-extensions pgsql
RUN curl -L https://github.com/ReimuHakurei/phpPgAdmin/archive/refs/tags/v7.14.7-mod.tar.gz | tar xvz -C /var/www/html --strip-components 1

COPY config/ports.conf /etc/apache2/ports.conf
COPY config/config.inc.php /var/www/html/conf/config.inc.php
