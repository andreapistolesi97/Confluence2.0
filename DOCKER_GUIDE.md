# Confluence - Guida Docker

## Panoramica

Confluence e' un'applicazione Laravel 12 per la gestione di business driver, contatti, permessi utente, monitoring e azioni di produzione.

L'ambiente Docker e' composto da **6 servizi** che replicano un'infrastruttura completa:

| Servizio | Immagine | Ruolo | Porta esposta |
|----------|----------|-------|---------------|
| **app** | php:8.4-fpm-alpine | Applicazione Laravel (PHP-FPM) | 9000 (interno) |
| **nginx** | nginx:1.27-alpine | Web server / reverse proxy | **8081** |
| **mysql** | mysql:8.4 | Database primario + contatti | **3307** |
| **redis** | redis:7-alpine | Cache, sessioni, code | **6379** |
| **vite** | node:22-alpine | Dev server per asset frontend | **5173** |
| **queue** | (stessa immagine di app) | Worker per job in background | - |

---

## Prerequisiti

- **Docker Desktop** (Windows/macOS) oppure **Docker Engine + Docker Compose** (Linux)
  - Docker >= 24.0
  - Docker Compose >= 2.20
- **Git** per clonare il repository
- **4 GB di RAM** liberi (consigliati)
- Porte **8081**, **3307**, **6379**, **5173** libere sul sistema

### Verifica installazione

```bash
docker --version          # Docker version 24.x o superiore
docker compose version    # Docker Compose version v2.20 o superiore
```

---

## Avvio rapido (5 minuti)

### 1. Clona il repository

```bash
git clone <URL_REPOSITORY> confluence_deploy
cd confluence_deploy
```

### 2. Avvia tutto

```bash
docker compose up --build -d
```

Questo comando:
- **Costruisce** l'immagine PHP-FPM con tutte le estensioni necessarie
- **Avvia** MySQL e Redis (con healthcheck)
- **Aspetta** che MySQL sia healthy, poi avvia l'applicazione
- **Esegue automaticamente** al primo avvio:
  - `composer install` (dipendenze PHP)
  - `php artisan key:generate` (chiave di crittografia)
  - `php artisan migrate` (creazione tabelle)
  - `php artisan storage:link` (symlink per file pubblici)
- **Avvia** Vite (installa npm e compila asset)
- **Avvia** il queue worker per i job in background

### 3. Crea un utente di test

Il database parte vuoto. Per poter accedere all'applicazione, crea un utente:

```bash
docker compose exec app php artisan tinker --execute="App\Models\User::create(['name'=>'Andrea','surname'=>'Pistolesi','email'=>'andrea.pistolesi@example.it','password'=>bcrypt('Abc123!'),'role'=>'Admin','username'=>'andrea.pistolesi']);"
```

Credenziali di accesso:
- **Email:** `andrea.pistolesi@example.it`
- **Password:** `Abc123!`

Puoi modificare nome, email, password e ruolo a piacere. Ruoli disponibili: `Admin`, `Integrator`, `Production Planner`, `Sales`.

### 4. Apri l'applicazione

```
http://localhost:8081
```

Il primo avvio richiede circa **2-3 minuti** perche' deve:
- Scaricare le immagini Docker (~1 GB totali)
- Compilare le estensioni PHP
- Installare le dipendenze Composer e npm
- Eseguire le migrations

I riavvii successivi saranno molto piu' rapidi (~15 secondi).

---

## Struttura dei file Docker

```
confluence_deploy/
├── Dockerfile                          # Immagine PHP-FPM
├── compose.yaml                        # Orchestrazione servizi
├── .env.docker                         # Variabili d'ambiente per Docker
├── .dockerignore                       # File esclusi dal build
└── docker/
    ├── php/
    │   ├── entrypoint.sh               # Script di bootstrap
    │   └── php.ini                     # Configurazione PHP
    ├── nginx/
    │   └── default.conf                # Configurazione Nginx
    └── mysql/
        └── init-contacts-db.sql        # Crea il DB contatti al primo avvio
```

---

## Comandi utili

### Gestione container

```bash
# Avvia tutti i servizi (in background)
docker compose up -d

# Avvia e ricostruisci le immagini
docker compose up --build -d

# Ferma tutti i servizi
docker compose down

# Ferma e CANCELLA i volumi (reset completo del database!)
docker compose down -v

# Vedi lo stato dei container
docker compose ps

# Vedi i log di tutti i servizi
docker compose logs -f

# Vedi i log di un servizio specifico
docker compose logs -f app
docker compose logs -f nginx
docker compose logs -f mysql
docker compose logs -f queue
docker compose logs -f vite
```

### Comandi Laravel (dentro il container)

```bash
# Apri una shell nel container app
docker compose exec app bash

# Esegui comandi artisan direttamente
docker compose exec app php artisan migrate:status
docker compose exec app php artisan tinker
docker compose exec app php artisan cache:clear
docker compose exec app php artisan config:clear
docker compose exec app php artisan route:list

# Esegui composer
docker compose exec app composer install
docker compose exec app composer require pacchetto/nome

# Esegui i test
docker compose exec app php artisan test
```

### Database

```bash
# Accedi alla console MySQL
docker compose exec mysql mysql -u confluence -pconfluence confluence

# Importa il dump del database (se disponibile)
docker compose exec -T mysql mysql -u confluence -pconfluence confluence < dump.sql

# Esporta un backup del database
docker compose exec mysql mysqldump -u confluence -pconfluence confluence > backup.sql
```

### Frontend

```bash
# Apri una shell nel container Vite
docker compose exec vite sh

# Ricostruisci gli asset per produzione
docker compose exec vite npm run build

# Reinstalla le dipendenze npm
docker compose exec vite npm install
```

---

## Configurazione

### Variabili d'ambiente

Il file `.env.docker` contiene tutte le configurazioni. Viene copiato automaticamente in `.env` al primo avvio.

**Per modificare la configurazione:**

1. Modifica `.env.docker`
2. Cancella il file `.env` generato: `rm .env`
3. Riavvia: `docker compose restart app`

Oppure modifica direttamente `.env` (non verra' sovrascritto se esiste gia').

### Configurare la mail SMTP

La mail e' impostata su `log` (le email vengono scritte nei log invece di essere inviate). Per abilitare l'invio reale:

1. Modifica `.env.docker` (o `.env`):
```env
MAIL_MAILER=smtp
MAIL_PASSWORD=la_tua_password_reale
```
2. Riavvia il container app:
```bash
docker compose restart app
```

### Database contatti

Il database `confluence_contacts` viene creato automaticamente al primo avvio di MySQL. Se hai dei dati da importare:

```bash
docker compose exec -T mysql mysql -u confluence -pconfluence confluence_contacts < il_tuo_dump_contatti.sql
```

---

## Architettura Docker

### Come funziona il bootstrap

Quando il container `app` si avvia, lo script `entrypoint.sh` esegue questi passaggi in ordine:

```
1. Attende che MySQL sia raggiungibile (polling con PDO)
2. Copia .env.docker -> .env  (solo se .env non esiste)
3. composer install            (solo se vendor/ non esiste)
4. php artisan key:generate    (solo se APP_KEY manca)
5. php artisan migrate         (sempre, applica nuove migrations)
6. php artisan storage:link    (solo se il symlink non esiste)
7. Cache config/route/view     (solo se APP_DEBUG=false)
8. Fix permessi su storage/ e bootstrap/cache/
9. Avvia php-fpm
```

### Flusso delle richieste HTTP

```
Browser (localhost:8081)
    │
    ▼
  Nginx (porta 80 interna)
    │
    ├── File statico (CSS/JS/immagini) → servito direttamente
    │
    └── Richiesta PHP → FastCGI → PHP-FPM (app:9000)
                                      │
                                      ├── MySQL (dati)
                                      ├── Redis (cache/sessioni/code)
                                      └── Queue worker (job async)
```

### Persistenza dati

| Dato | Dove | Persistente? |
|------|------|--------------|
| Database MySQL | Volume Docker `confluence_mysql` | Si, sopravvive ai restart |
| Sessioni | Redis (in memoria) | No, perse al restart di Redis |
| Cache | Redis (in memoria) | No, rigenerata automaticamente |
| Code/Job | Redis (in memoria) | No, job pending persi al restart |
| File caricati | `storage/app/` (bind mount) | Si, su filesystem host |
| Codice sorgente | `.` (bind mount) | Si, su filesystem host |

---

## Hot Reload (sviluppo)

- **PHP**: le modifiche ai file `.php` sono immediatamente visibili (bind mount + no OPcache in dev)
- **Blade**: le modifiche ai template `.blade.php` sono immediate
- **CSS/JS**: Vite rileva le modifiche e aggiorna il browser automaticamente (HMR sulla porta 5173)
- **Composer**: dopo un `composer require`, esegui `docker compose restart app`
- **Migrations**: esegui `docker compose exec app php artisan migrate`

---

## Troubleshooting

### Il sito non si apre (porta 8081)

```bash
# Verifica che tutti i container siano running
docker compose ps

# Controlla i log dell'app per errori
docker compose logs app

# Controlla i log di nginx
docker compose logs nginx
```

### Errore "Permission denied" su storage/

```bash
docker compose exec app chmod -R 775 storage bootstrap/cache
docker compose exec app chown -R www:www storage bootstrap/cache
```

### MySQL non si avvia / errore di healthcheck

```bash
# Controlla i log di MySQL
docker compose logs mysql

# Se il database e' corrotto, reset completo:
docker compose down -v
docker compose up --build -d
```

### Vite non compila / errori npm

```bash
# Reinstalla le dipendenze
docker compose exec vite rm -rf node_modules
docker compose restart vite

# Controlla i log
docker compose logs vite
```

### Queue worker non processa i job

```bash
# Controlla i log del queue worker
docker compose logs queue

# Riavvia il worker
docker compose restart queue
```

### Reset completo dell'ambiente

```bash
# Ferma tutto, cancella volumi e ricostruisci
docker compose down -v
docker compose up --build -d
```

Questo ricrea il database da zero, riesegue le migrations e reinstalla tutte le dipendenze.

---

## Porte e accessi di riferimento

| Servizio | URL / Host | Credenziali |
|----------|------------|-------------|
| Applicazione web | http://localhost:8081 | (login dell'app) |
| Vite HMR | http://localhost:5173 | - |
| MySQL | `127.0.0.1:3307` | user: `confluence` / pass: `confluence` |
| MySQL (root) | `127.0.0.1:3307` | user: `root` / pass: `root` |
| Redis | `127.0.0.1:6379` | nessuna password |

### Connessione da client GUI

Per connettersi al database con strumenti come **DBeaver**, **TablePlus**, **MySQL Workbench**:
- Host: `127.0.0.1`
- Porta: `3307`
- Database: `confluence` (o `confluence_contacts`)
- Utente: `confluence`
- Password: `confluence`
