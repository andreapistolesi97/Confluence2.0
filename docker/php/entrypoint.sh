#!/bin/bash
set -e

echo "============================================"
echo "  Confluence - Bootstrap Laravel"
echo "============================================"

# ── 1. Attendi MySQL ──────────────────────────────────────
echo "==> Attendo MySQL su ${DB_HOST:-mysql}:${DB_PORT:-3306}..."
until php -r "
  try {
    new PDO(
      'mysql:host=${DB_HOST:-mysql};port=${DB_PORT:-3306}',
      '${DB_USERNAME:-confluence}',
      '${DB_PASSWORD:-confluence}'
    );
    echo 'ok';
  } catch (Exception \$e) { exit(1); }
" 2>/dev/null | grep -q ok; do
  sleep 2
done
echo "==> MySQL pronto."

# ── 2. File .env ──────────────────────────────────────────
if [ ! -f .env ]; then
  echo "==> Copio .env.docker -> .env"
  cp .env.docker .env
fi

# ── 3. Dipendenze Composer ────────────────────────────────
if [ ! -f vendor/autoload.php ]; then
  echo "==> composer install..."
  composer install --no-interaction --prefer-dist --optimize-autoloader
fi

# ── 4. APP_KEY ────────────────────────────────────────────
if ! grep -q '^APP_KEY=base64:' .env; then
  echo "==> Genero APP_KEY..."
  php artisan key:generate --force
fi

# ── 5. Migrations ─────────────────────────────────────────
echo "==> Eseguo migrations..."
php artisan migrate --force --no-interaction

# ── 6. Storage link ───────────────────────────────────────
if [ ! -L public/storage ]; then
  echo "==> Creo storage link..."
  php artisan storage:link
fi

# ── 7. Cache (solo in produzione) ─────────────────────────
if [ "${APP_DEBUG}" = "false" ]; then
  echo "==> Cache config / route / view..."
  php artisan config:cache
  php artisan route:cache
  php artisan view:cache
fi

# ── 8. Permessi ───────────────────────────────────────────
echo "==> Fix permessi..."
chown -R www:www storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

echo "============================================"
echo "  Bootstrap completato - avvio servizio"
echo "============================================"

exec "$@"
