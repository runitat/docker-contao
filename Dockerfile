FROM php:5-apache

RUN apt-get update && \
    apt-get install -y jq wget zip libfreetype6-dev libjpeg62-turbo-dev libpng-dev zlib1g-dev libicu-dev libxml2-dev g++ && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mysqli gd intl soap && \
    curl -s https://api.github.com/repos/contao/core/releases/latest | jq '.["assets"][0] .browser_download_url' | xargs wget -qO- | tar -xvz && \
    /bin/bash -c "shopt -s dotglob && mv contao-*/* . && chown -R www-data:www-data *" && \
    rm -r contao-* && \
    mv .htaccess.default .htaccess && \
    a2enmod rewrite && \
    apt-get remove -y jq wget zip g++ && \
    rm -rf /var/lib/apt/lists/*

VOLUME /var/www/html
EXPOSE 80

