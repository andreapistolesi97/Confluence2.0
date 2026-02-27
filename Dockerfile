FROM php:8.4-fpm-alpine

# System deps
RUN apk add --no-cache \
    bash \
    git \
    curl \
    unzip \
    icu-dev \
    libzip-dev \
    oniguruma-dev \
    zlib-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev

# PHP extensions
RUN docker-php-ext-configure intl \
 && docker-php-ext-install -j$(nproc) pdo_mysql intl zip mbstring opcache

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# User (optional but nice)
RUN addgroup -g 1000 -S www \
 && adduser -u 1000 -S www -G www

WORKDIR /var/www/html

# Permissions (Laravel needs storage + bootstrap/cache writable)
RUN chown -R www:www /var/www/html

USER www