# Relazione Tecnica: Infrastruttura Docker e Guida all'Installazione

## 1. Introduzione
La presente documentazione descrive l'architettura di containerizzazione implementata per il progetto **Confluence**. L'intera infrastruttura è progettata per essere robusta, scalabile e facilmente portabile tra diversi ambienti di sviluppo, garantendo al contempo la parità tra gli ambienti e una gestione semplificata delle dipendenze.

---

## 2. Architettura del Sistema
Il progetto adotta un'architettura a micro-servizi orchestrata tramite **Docker Compose**. Di seguito il dettaglio dei componenti:

### 2.1. Container Applicativo (`app`)
- **Immagine:** Base PHP 8.4-fpm su Alpine Linux (ottimizzata per dimensioni e sicurezza).
- **Ruolo:** Gestisce la logica di business Laravel.
- **Caratteristiche:**
  - Estensioni PHP pre-installate: `pdo_mysql`, `redis`, `gd`, `intl`, `zip`, `bcmath`, `opcache`.
  - Gestione avanzata dei permessi tramite `su-exec` per garantire che i processi PHP non girino mai come root, ma abbiano i permessi necessari sulle cartelle `storage` e `cache`.

### 2.2. Web Server (`nginx`)
- **Immagine:** Nginx 1.27-alpine.
- **Ruolo:** Gestisce le richieste HTTP(S), serve i file statici e inoltra le chiamate dinamiche al container `app` tramite protocollo FastCGI.

### 2.3. Database Layer (`mysql`)
- **Immagine:** MySQL 8.4 (Oracle Linux).
- **Ruolo:** Persistenza dei dati relazionali.
- **Persistenza:** Utilizza un volume Docker dedicato per evitare la perdita di dati allo spegnimento del container.

### 2.4. Cache & Queue Buffer (`redis`)
- **Immagine:** Redis 7-alpine.
- **Ruolo:** Gestione della cache applicativa e buffer per le code (queues) di Laravel.

### 2.5. Frontend Development (`vite`)
- **Immagine:** Node 22-alpine.
- **Ruolo:** Compilazione degli asset in tempo reale (JavaScript/CSS) e Hot Module Replacement (HMR).

### 2.6. Background Workers (`queue`)
- **Immagine:** Stessa immagine del container `app`.
- **Ruolo:** Esecuzione asincrona dei job in background, garantendo che le operazioni pesanti non blocchino l'interfaccia utente.

---

## 3. Requisiti di Sistema
Per avviare correttamente il progetto su un nuovo PC, sono necessari i seguenti strumenti:
- **Docker Desktop** (versioni recenti consigliate).
- **Git** (per il controllo di versione).
- Connessione internet per il download iniziale delle immagini e delle dipendenze.

---

## 4. Procedura di Avvio Rapido

### Passo 1: Preparazione Ambiente
Aprire un terminale nella cartella del progetto. Non è necessario creare manualmente il file `.env`, poiché il sistema lo farà automaticamente durante il primo avvio utilizzando il template `.env.docker`.

### Passo 2: Build e Avvio
Eseguire il comando seguente per costruire le immagini e avviare tutti i servizi in modalità "detached" (background):
```bash
docker compose up --build -d
```

### Passo 3: Verifica dello Stato
Il sistema esegue un bootstrap automatico (attesa database, migrazioni, installazione librerie). È possibile monitorare l'avanzamento con:
```bash
docker compose logs -f app
```
L'applicazione è pronta quando nel log appare il messaggio: `==> [entrypoint] Bootstrap completato`.

---

## 5. Accesso e Riferimenti di Rete

| Servizio | URL / Endpoint | Porta Host |
| :--- | :--- | :--- |
| **Applicazione Web** | [http://localhost:8081](http://localhost:8081) | 8081 |
| **HMR (Vite)** | [http://localhost:5173](http://localhost:5173) | 5173 |
| **MySQL (Accesso Esterno)** | `127.0.0.1` | 3307 |
| **Redis** | `127.0.0.1` | 6379 |

---

## 6. Risoluzione dei Problemi Comuni

### 6.1. Problemi di Permessi (Windows/Linux/Mac)
L'entrypoint del container `app` è configurato per correggere automaticamente i permessi delle cartelle `storage` e `bootstrap/cache`. Qualora si riscontrassero problemi, un riavvio dei container con `docker compose restart app` solitamente risolve l'anomalia.

### 6.2. Pulizia Totale Ambiente
In caso di errori persistenti o necessità di reset completo (Attenzione: elimina tutti i dati nel DB!):
```bash
docker compose down -v
docker compose up --build -d
```

---

## 7. Manutenzione e Sviluppo
I principali comandi di gestione sono:
- **Artisan:** `docker compose exec app php artisan <comando>`
- **Composer:** `docker compose exec app composer <comando>`
- **Shell Interattiva:** `docker compose exec app bash`
- **Spegnimento:** `docker compose down`

---

## 8. Conclusione
L'infrastruttura è stata validata e testata. Grazie all'uso di `su-exec` e di un robusto script di entrypoint, il progetto offre un'esperienza "one-click" per i nuovi sviluppatori, riducendo drasticamente i tempi di setup e i conflitti di configurazione.
