FROM php:7.0-apache

COPY docker-config/000-default.conf /etc/apache2/sites-available/000-default.conf

ENV APP_ROOT /var/www/html

COPY app $APP_ROOT/app
COPY src $APP_ROOT/src
COPY var $APP_ROOT/var
COPY vendor $APP_ROOT/vendor
COPY web $APP_ROOT/web

RUN . $APACHE_ENVVARS \
	&& chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP $APP_ROOT

RUN a2enmod rewrite \
	&& docker-php-ext-install pdo pdo_mysql
