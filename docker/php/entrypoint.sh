#!/bin/bash
set -e

echo "==> [entrypoint] Avvio bootstrap Laravel..."

# -------------------------------------------------------
# 1. Attendi che MySQL sia disponibile
# -------------------------------------------------------
echo "==> [entrypoint] Attendo MySQL su ${DB_HOST}:${DB_PORT:-3306}..."
until php -r "
  try {
    \$pdo = new PDO(
      'mysql:host=${DB_HOST:-mysql};port=${DB_PORT:-3306};dbname=${DB_DATABASE:-confluence}',
      '${DB_USERNAME:-confluence}',
      '${DB_PASSWORD:-confluence}'
    );
    echo 'ok';
  } catch (Exception \$e) {
    exit(1);
  }
" 2>/dev/null | grep -q ok; do
  echo "==> [entrypoint] MySQL non ancora pronto, riprovo tra 2s..."
  sleep 2
done
echo "==> [entrypoint] MySQL pronto!"

# -------------------------------------------------------
# 2. Copia .env se non esiste
# -------------------------------------------------------
if [ ! -f /var/www/html/.env ]; then
  echo "==> [entrypoint] Copio .env.docker -> .env"
  cp /var/www/html/.env.docker /var/www/html/.env
fi

# -------------------------------------------------------
# 3. Installa dipendenze Composer se vendor/ non esiste
# -------------------------------------------------------
if [ ! -d /var/www/html/vendor ]; then
  echo "==> [entrypoint] Eseguo composer install..."
  composer install --no-interaction --prefer-dist --optimize-autoloader
fi

# -------------------------------------------------------
# 4. Genera APP_KEY se non presente
# -------------------------------------------------------
APP_KEY_VALUE=$(grep -E "^APP_KEY=" /var/www/html/.env | cut -d'=' -f2 | tr -d '[:space:]')
if [ -z "$APP_KEY_VALUE" ]; then
  echo "==> [entrypoint] Genero APP_KEY..."
  php artisan key:generate --force
fi

# -------------------------------------------------------
# 5. Esegui migration
# -------------------------------------------------------
echo "==> [entrypoint] Eseguo migrations..."
php artisan migrate --force

# -------------------------------------------------------
# 6. Storage link
# -------------------------------------------------------
if [ ! -L /var/www/html/public/storage ]; then
  echo "==> [entrypoint] Creo storage link..."
  php artisan storage:link
fi

# -------------------------------------------------------
# 7. Cache config & route (solo se non in debug mode)
# -------------------------------------------------------
if [ "${APP_DEBUG}" = "false" ]; then
  echo "==> [entrypoint] Cache config e route..."
  su-exec www php artisan config:cache
  su-exec www php artisan route:cache
  su-exec www php artisan view:cache
fi

# -------------------------------------------------------
# 8. Permessi storage e bootstrap/cache
# -------------------------------------------------------
echo "==> [entrypoint] Fix permessi..."
chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache
chown -R www:www /var/www/html/storage /var/www/html/bootstrap/cache

echo "==> [entrypoint] Bootstrap completato. Avvio php-fpm..."
exec php-fpm
