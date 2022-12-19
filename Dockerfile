FROM php:8.1-fpm-buster
RUN apt-get update && apt-get install -y \
    openssl \
    bash \
    mariadb-client \
    nodejs \
    npm \
    git \
    zip \
    unzip

RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
ENTRYPOINT ["php-fpm"]