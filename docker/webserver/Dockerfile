FROM php:7.0-apache

RUN a2enmod rewrite \
	&& docker-php-ext-install pdo pdo_mysql

ENV APP_ROOT /var/www/html
COPY ../../app $APP_ROOT/app
COPY ../../src $APP_ROOT/src
COPY ../../var $APP_ROOT/var
COPY ../../vendor $APP_ROOT/vendor
COPY ../../web $APP_ROOT/web

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./parameters.yml /var/www/html/app/config/parameters.yml

RUN . $APACHE_ENVVARS \
	&& chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP $APP_ROOT \
