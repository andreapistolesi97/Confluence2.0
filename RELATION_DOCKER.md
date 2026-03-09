# Relazione Tecnica: Infrastruttura Docker e Guida all'Installazione

## 1. Guida all'Avvio per il Docente (Procedura Rapida)

Seguire questi passaggi per avviare il progetto su un computer pulito. La procedura è completamente automatizzata.

### Requisiti
- **Docker Desktop** installato e attivo.
- **Git** installato.

### Procedura Passo-Passo
Apre un terminale (o PowerShell/CMD su Windows) e digiti i seguenti comandi:

1.  **Clonazione del Progetto:**
    ```bash
    git clone https://github.com/andreapistolesi97/Confluence2.0.git
    cd Confluence2.0
    ```

2.  **Lancio dell'Architettura:**
    ```bash
    docker compose up --build -d
    ```

3.  **Attesa Inizializzazione:**
    Il primo avvio richiede circa 1-2 minuti perché il sistema deve scaricare le immagini e installare le librerie. Per verificare quando il sistema è pronto, può osservare i log:
    ```bash
    docker compose logs -f app
    ```
    Appena legge `==> [entrypoint] Bootstrap completato`, l'app è pronta.

4.  **Accesso:**
    Aprire il browser all'indirizzo: **[http://localhost:8081](http://localhost:8081)**

---

## 2. Guida Dettagliata per Sviluppatori

### 2.1. Introduzione
La presente documentazione descrive l'architettura di containerizzazione implementata per il progetto **Confluence**. L'intera infrastruttura è progettata per essere robusta, scalabile e facilmente portabile tra diversi ambienti di sviluppo, garantendo al contempo la parità tra gli ambienti e una gestione semplificata delle dipendenze.

### 2.2. Architettura del Sistema
Il progetto adotta un'architettura a micro-servizi orchestrata tramite **Docker Compose**. Di seguito il dettaglio dei componenti:

#### Container Applicativo (`app`)
- **Immagine:** Base PHP 8.4-fpm su Alpine Linux (ottimizzata per dimensioni e sicurezza).
- **Ruolo:** Gestisce la logica di business Laravel.
- **Caratteristiche:**
  - Estensioni PHP pre-installate: `pdo_mysql`, `redis`, `gd`, `intl`, `zip`, `bcmath`, `opcache`.
  - Gestione avanzata dei permessi: l'entrypoint viene avviato come `root` per garantire la corretta impostazione dei permessi sulle cartelle di Laravel (`storage`, `cache`) e per permettere a PHP-FPM di aprire i flussi di log. Successivamente, PHP-FPM scala automaticamente i privilegi all'utente non-root `www` per l'esecuzione dell'app.
  - **Sicurezza:** L'entrypoint verifica e genera automaticamente la `APP_KEY` di Laravel se mancante, garantendo che l'applicazione sia sempre pronta all'uso.

#### Web Server (`nginx`)
- **Immagine:** Nginx 1.27-alpine.
- **Ruolo:** Gestisce le richieste HTTP(S), serve i file statici e inoltra le chiamate dinamiche al container `app`.

#### Database Layer (`mysql`)
- **Immagine:** MySQL 8.4 (Oracle Linux).
- **Ruolo:** Persistenza dei dati relazionali.
- **Persistenza:** Utilizza un volume Docker dedicato per evitare la perdita di dati allo spegnimento.

#### Cache & Queue Buffer (`redis`)
- **Immagine:** Redis 7-alpine.
- **Ruolo:** Gestione della cache applicativa e buffer per le code (queues) di Laravel.

#### Frontend Development (`vite`)
- **Immagine:** Node 22-alpine.
- **Ruolo:** Compilazione degli asset in tempo reale (JavaScript/CSS) e Hot Module Replacement (HMR).

#### Background Workers (`queue`)
- **Immagine:** Stessa immagine del container `app`.
- **Ruolo:** Esecuzione asincrona dei job in background.

---

## 3. Requisiti di Sistema
Per avviare correttamente il progetto su un nuovo PC, sono necessari i seguenti strumenti:
- **Docker Desktop** (versioni recenti consigliate).
- **Git** (per il controllo di versione).
- Connessione internet per il download iniziale delle immagini e delle dipendenze.

---

## 4. Procedura di Avvio Rapido (Standard)

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

### 6.1. Problemi di Permessi
L'entrypoint del container `app` è configurato per correggere automaticamente i permessi delle cartelle `storage` e `bootstrap/cache` ad ogni avvio. Se riscontri errori di accesso, prova a riavviare con:
```bash
docker compose restart app
```

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
- **Shell:** `docker compose exec app bash`
- **Stop:** `docker compose down`

---

## 8. Conclusione
L'infrastruttura è stata validata e testata. Grazie all'uso dell'entrypoint intelligente e della corretta gestione degli utenti, il progetto offre un'esperienza "one-click" per i docenti e gli sviluppatori, riducendo i tempi di setup e i conflitti di configurazione.
