# Docker — Guida rapida

Stack: **PHP 8.4-fpm**, **Nginx 1.27**, **MySQL 8.4**, **Redis 7**, **Node 22 (Vite)**, **Queue worker**

## Requisiti

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installato e avviato

## Primo avvio

```bash
# 1. Build delle immagini e avvio di tutti i servizi in background
docker compose up --build -d
```

All'avvio il container `app` eseguirà automaticamente:
- Attesa che MySQL sia disponibile
- `composer install` (se `vendor/` non esiste)
- Copia di `.env.docker` → `.env` (se `.env` non esiste)
- `php artisan key:generate`
- `php artisan migrate --force`
- `php artisan storage:link`
- `php artisan config:cache` / `route:cache` (solo se `APP_DEBUG=false`)

Dopodiché l'applicazione sarà disponibile su **http://localhost:8081**

## Comandi utili

```bash
# Stato dei container
docker compose ps

# Log del container app (utile per il bootstrap iniziale)
docker compose logs -f app

# Eseguire comandi artisan
docker compose exec app php artisan migrate:status
docker compose exec app php artisan tinker

# Shell interattiva nel container app
docker compose exec app bash

# Eseguire composer
docker compose exec app composer require pacchetto/nome

# Fermare tutti i container
docker compose down

# Fermare e rimuovere anche i volumi (⚠️ elimina il database)
docker compose down -v
```

## Porte esposte

| Servizio | Host         | Container |
|----------|-------------|-----------|
| App      | localhost:8081 | 80 (via Nginx) |
| Vite HMR | localhost:5173 | 5173 |
| MySQL    | localhost:3307 | 3306 |
| Redis    | localhost:6379 | 6379 |

## Configurazione

Modifica `.env.docker` per cambiare le variabili d'ambiente.  
In particolare ricorda di impostare **`MAIL_PASSWORD`** con la password reale SMTP.

## Build in produzione (senza Vite dev server)

```bash
# Compila gli asset frontend
docker compose exec vite npm run build

# Poi spegni il container vite (non serve in produzione)
docker compose stop vite
```
