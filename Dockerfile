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
    libpng-dev \
    su-exec

# PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) \
    pdo_mysql \
    intl \
    zip \
    mbstring \
    opcache \
    bcmath \
    gd

# Redis extension
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# PHP config
COPY docker/php/php.ini /usr/local/etc/php/conf.d/app.ini

# User
RUN addgroup -g 1000 -S www \
    && adduser -u 1000 -S www -G www

WORKDIR /var/www/html

# Entrypoint
COPY --chown=www:www docker/php/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN chown -R www:www /var/www/html

# USER www (Removed: entrypoint.sh handles dropping privileges with su-exec)

ENTRYPOINT ["entrypoint.sh"]