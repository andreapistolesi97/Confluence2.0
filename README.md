# Confluence

Applicazione Laravel 12 con Docker Compose.

## Tech Stack

- **PHP 8.4** (FPM Alpine)
- **Laravel 12**
- **MySQL 8.4**
- **Redis 7**
- **Nginx 1.27**
- **Vite 7** + Vue 3 + Tailwind CSS 4
- **Node 22**

## Architettura Docker

| Servizio | Container | Porta |
|----------|-----------|-------|
| PHP-FPM (app) | `confluence_app` | — |
| Nginx | `confluence_nginx` | `8081` |
| MySQL 8.4 | `confluence_mysql` | `3307` |
| Redis 7 | `confluence_redis` | `6379` |
| Vite (dev) | `confluence_vite` | `5173` |
| Queue worker | `confluence_queue` | — |

---

## Guida al Deploy Locale

### Prerequisiti

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installato e **avviato**
- I **10 file SQL** esportati da phpMyAdmin (dump completi di struttura + dati)

---

### Step 1 — Clona il repository

```bash
git clone https://github.com/TUO-USER/confluence_deploy.git
cd confluence_deploy
```

---

### Step 2 — Avvia i container

```bash
docker compose up --build -d
```

> La prima volta ci vogliono alcuni minuti per scaricare le immagini e installare le dipendenze.

---

### Step 3 — Attendi il bootstrap dell'app

```bash
docker compose logs -f app
```

Aspetta fino a che vedi:

```
==> Bootstrap completato!
```

Poi premi `Ctrl+C` per uscire dai log.

---

### Step 4 — Prepara MySQL per le import

Entra nella shell MySQL come root:

```bash
docker exec -it confluence_mysql mysql -uroot -proot
```

Esegui questi comandi SQL:

```sql
SET GLOBAL log_bin_trust_function_creators = 1;

GRANT ALL PRIVILEGES ON *.* TO 'confluence'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

EXIT;
```

---

### Step 5 — Ricrea il database principale

```bash
docker exec -it confluence_mysql mysql -uroot -proot -e "DROP DATABASE IF EXISTS confluence; CREATE DATABASE confluence CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

---

### Step 6 — Importa il database principale

Copia il file SQL dentro il container e importalo:

```bash
docker cp dbtp2gmxsji1pl.sql confluence_mysql:/tmp/dbtp2gmxsji1pl.sql

docker exec -it confluence_mysql mysql -uconfluence -pconfluence confluence < /dev/null
docker exec -it confluence_mysql bash -c "mysql -uconfluence -pconfluence confluence < /tmp/dbtp2gmxsji1pl.sql"
```

> Questo e' il database principale dell'app. Viene importato nel database `confluence`.

---

### Step 7 — Importa i 9 database dei business driver

Per **ognuno** dei 9 database, esegui questi 3 comandi (sostituisci `NOME_DB` con il nome reale del file/database):

```bash
docker exec -it confluence_mysql mysql -uroot -proot -e "DROP DATABASE IF EXISTS NOME_DB; CREATE DATABASE NOME_DB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; GRANT ALL PRIVILEGES ON NOME_DB.* TO 'confluence'@'%'; FLUSH PRIVILEGES;"

docker cp NOME_DB.sql confluence_mysql:/tmp/NOME_DB.sql

docker exec -it confluence_mysql bash -c "mysql -uconfluence -pconfluence NOME_DB < /tmp/NOME_DB.sql"
```

I 9 database sono:

| Database | Descrizione |
|----------|-------------|
| `db1ywgcfln6ko1` | Dfusione |
| `db8mwsqzhezgcg` | Media Prospect |
| `dbbsplwbo27riv` | Interactive Global Data |
| `dbbvt3npg0g3ey` | Lean ADV |
| `dbemqtn9jyekyk` | Lithium Main |
| `dbg3kzec8qennw` | Levante Media |
| `dbhi9cvdwadwsr` | Netpulse Media |
| `dbqmhgqdjxxyad` | Digity Solutions |
| `dby2mm99vtfozo` | Lithium Ads |

**Esempio completo per `db1ywgcfln6ko1`:**

```bash
docker exec -it confluence_mysql mysql -uroot -proot -e "DROP DATABASE IF EXISTS db1ywgcfln6ko1; CREATE DATABASE db1ywgcfln6ko1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; GRANT ALL PRIVILEGES ON db1ywgcfln6ko1.* TO 'confluence'@'%'; FLUSH PRIVILEGES;"

docker cp db1ywgcfln6ko1.sql confluence_mysql:/tmp/db1ywgcfln6ko1.sql

docker exec -it confluence_mysql bash -c "mysql -uconfluence -pconfluence db1ywgcfln6ko1 < /tmp/db1ywgcfln6ko1.sql"
```

> Ripeti per tutti e 9 i database.

---

### Step 8 — Apri l'applicazione

Vai su: **http://localhost:8081**

Credenziali di accesso:

| Campo | Valore |
|-------|--------|
| Email | `andrea.pistolesi@example.it` |
| Password | `Abc123!` |

---

## Comandi utili

```bash
# Ferma tutti i container
docker compose down

# Ferma e cancella TUTTI i dati (reset completo)
docker compose down -v

# Riavvia i container
docker compose up -d

# Log dell'app in tempo reale
docker compose logs -f app

# Shell nel container app
docker exec -it confluence_app bash

# Shell MySQL
docker exec -it confluence_mysql mysql -uconfluence -pconfluence confluence

# Esegui comandi Artisan
docker exec -it confluence_app php artisan <comando>
```

---

## Troubleshooting

| Problema | Soluzione |
|----------|-----------|
| **500 Internal Server Error** | Controlla i log: `docker compose logs -f app` |
| **504 Gateway Timeout** | Attendi il bootstrap completo oppure controlla: `docker compose logs -f nginx` |
| **Access denied for user** | Riesegui lo Step 4 (GRANT ALL PRIVILEGES) |
| **Table already exists** | Riesegui lo Step 5/7 con il `DROP DATABASE` prima del `CREATE DATABASE` |
| **Container name conflict** | `docker rm -f confluence_app confluence_nginx confluence_mysql confluence_redis confluence_vite confluence_queue` e poi riesegui `docker compose up --build -d` |
