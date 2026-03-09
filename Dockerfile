FROM php:8.4-fpm-alpine

# ── Dipendenze di sistema ─────────────────────────────────
RUN apk add --no-cache \
    bash curl git unzip \
    icu-dev libzip-dev oniguruma-dev zlib-dev \
    freetype-dev libjpeg-turbo-dev libpng-dev

# ── Estensioni PHP ────────────────────────────────────────
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) \
        pdo_mysql intl zip mbstring opcache bcmath gd pcntl

# ── Redis (PECL) ─────────────────────────────────────────
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS

# ── Composer ──────────────────────────────────────────────
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# ── Configurazione PHP ────────────────────────────────────
COPY docker/php/php.ini /usr/local/etc/php/conf.d/app.ini

# ── Utente non-root ───────────────────────────────────────
RUN addgroup -g 1000 -S www \
    && adduser -u 1000 -S www -G www

# ── PHP-FPM: worker come utente 'www' ────────────────────
RUN sed -i 's/user = www-data/user = www/g' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i 's/group = www-data/group = www/g' /usr/local/etc/php-fpm.d/www.conf

WORKDIR /var/www/html

# ── Entrypoint ────────────────────────────────────────────
COPY docker/php/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm"]
