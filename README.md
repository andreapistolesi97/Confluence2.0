# Confluence

Applicazione Laravel per l'esame di Applicazioni Web Mobile e Cloud

- **Docenti:** Bonura Diego - Lillini Christian
- **Autore:** Pistolesi Andrea
- **Nome progetto:** Confluence

---

## Guida al Deploy Locale

### Prerequisiti

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installato e **avviato**
- [Git](https://git-scm.com/)

---

### Step 1 — Clonare il repository

```bash
git clone https://github.com/andreapistolesi97/Confluence2.0.git
cd Confluence2.0
```

---

### Step 2 — Avviare Docker

```bash
docker compose up --build -d
```

---

### Step 3 — Attendere il bootstrap

```bash
docker compose logs -f app
```

Aspettare finche' non compare:

```
Bootstrap completato - avvio servizio
ready to handle connections
```

Premere `Ctrl+C` per uscire dai log.

---

### Step 4 — Preparare MySQL per l'import

```bash
docker compose exec mysql mysql -u root -proot -e "SET GLOBAL log_bin_trust_function_creators=1; GRANT ALL PRIVILEGES ON *.* TO 'confluence'@'%'; FLUSH PRIVILEGES;"
```

---

### Step 5 — Importare il database principale (utenti, permessi, tutte le tabelle)

```bash
docker compose exec mysql mysql -u root -proot -e "DROP DATABASE confluence; CREATE DATABASE confluence CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

docker compose exec -T mysql mysql -u confluence -pconfluence confluence < dbtp2gmxsji1pl.sql
```

---

### Step 6 — Importare i 9 database dei business driver (tutte le tabelle e tutti i dati)

```bash
docker compose exec -T mysql mysql -u confluence -pconfluence db1ywgcfln6ko1 < db1ywgcfln6ko1.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence db8mwsqzhezgcg < db8mwsqzhezgcg.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbbsplwbo27riv < dbbsplwbo27riv.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbbvt3npg0g3ey < dbbvt3npg0g3ey.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbemqtn9jyekyk < dbemqtn9jyekyk.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbg3kzec8qennw < dbg3kzec8qennw.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbhi9cvdwadwsr < dbhi9cvdwadwsr.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dbqmhgqdjxxyad < dbqmhgqdjxxyad.sql && \
docker compose exec -T mysql mysql -u confluence -pconfluence dby2mm99vtfozo < dby2mm99vtfozo.sql
```

---

### Step 7 — Aprire l'applicazione

Vai su: **http://localhost:8081**

Credenziali:

| Campo | Valore |
|-------|--------|
| Email | `andrea.pistolesi@example.it` |
| Password | `Abc123!` |
