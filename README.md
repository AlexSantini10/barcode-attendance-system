# Barcode Attendance System 🔖

Sistema di rilevamento presenze tramite lettore di codici a barre, sviluppato come progetto scolastico per i corsi di **Sistemi e Reti** e **TPSIT**.

---

## Descrizione

Il sistema permette di tracciare entrate e uscite di studenti/docenti tramite la scansione di un codice a barre univoco assegnato a ciascun utente. Un Raspberry Pi collegato al lettore di codici a barre acquisisce ogni scansione, aggiorna il database MySQL e la dashboard web si aggiorna in tempo reale mostrando il log degli accessi.

---

## Architettura

```
[Lettore barcode] --> [Raspberry Pi - script.py] --> [Database MySQL]
                                                              |
                                              [Web Server PHP + Bootstrap]
                                                              |
                                                    [Browser - dashboard]
```

1. **script.py** — gira sul Raspberry Pi, legge l'input dal lettore di codici a barre, interroga il database e registra l'entrata o l'uscita dell'utente. Può anche pilotare un LED GPIO come feedback visivo.
2. **Backend PHP** — espone endpoint REST che restituiscono i dati del database in JSON.
3. **Frontend JavaScript** — esegue polling ogni secondo per verificare se ci sono aggiornamenti e, in caso positivo, ricarica la tabella del log.
4. **Database MySQL** — contiene gli utenti (`anagrafica`), il log degli accessi (`log`) e tabelle di supporto.

---

## Tecnologie utilizzate

| Layer | Tecnologia |
|---|---|
| Hardware | Raspberry Pi, Lettore barcode USB |
| Script acquisizione | Python 3, `mysql-connector-python`, `gpiozero` |
| Backend | PHP, MySQLi |
| Frontend | HTML, JavaScript (Fetch API), Bootstrap 5 |
| Database | MySQL / MariaDB |

---

## Struttura del progetto

```
├── conn.db.php          # Configurazione connessione al database
├── index.php            # Dashboard principale (log entrate/uscite)
├── users.php            # Pagina gestione utenti (anagrafica)
├── script.js            # Polling aggiornamenti e rendering tabella log
├── users_script.js      # Script JS per la pagina utenti
├── script.py            # Script Python per Raspberry Pi (lettura barcode)
├── get_nomi.php         # API: restituisce il log con nomi e orari
├── get_log.php          # API: restituisce la tabella log grezza
├── get_anagrafica.php   # API: restituisce gli utenti registrati
├── get_update.php       # API: controlla se ci sono aggiornamenti da mostrare
├── set_updated.php      # API: resetta il flag di aggiornamento
└── witchers.sql         # Dump SQL del database di esempio
```

---

## Schema del database

Il database si chiama `witchers` e contiene le seguenti tabelle:

- **`anagrafica`** — dati degli utenti: ID, codice barcode, nome, cognome, email, abitazione, flag insegnante, flag "è nella scuola".
- **`log`** — storico degli accessi: ID, userID (FK), entrata/uscita, timestamp.
- **`deskentratauscita`** — tabella di decodifica: `0` = uscita, `1` = entrata.
- **`toupdate`** — flag utilizzato dal frontend per sapere se deve ricaricare la tabella.

---

## Installazione e configurazione

### Requisiti
- PHP 7.4+ con estensione `mysqli`
- MySQL / MariaDB
- Python 3 con i pacchetti `mysql-connector-python` e (su Raspberry Pi) `gpiozero`
- Web server (es. Apache con XAMPP, o Nginx)

### 1. Importa il database

```bash
mysql -u root -p < witchers.sql
```

### 2. Configura la connessione

Modifica `conn.db.php` con le credenziali del tuo database:

```php
$host = 'localhost';
$user = 'root';
$pass = 'tuapassword';
$db   = 'witchers';
```

### 3. Avvia il web server

Copia i file nella directory del web server (es. `htdocs` per XAMPP) e raggiungi `http://localhost/barcode/index.php`.

### 4. Avvia lo script Python sul Raspberry Pi

Assicurati che `mysql-connector-python` sia installato:

```bash
pip install mysql-connector-python
```

Se stai girando su Raspberry Pi con il LED GPIO collegato al pin 14, imposta `iAmOnRaspberry = True` in `script.py`, poi avvia:

```bash
python script.py
```

Lo script legge l'input del lettore barcode dallo `stdin` e registra entrate/uscite in tempo reale.

---

## Funzionamento

1. Ogni utente ha un codice a barre univoco registrato nella tabella `anagrafica`.
2. Quando lo studente/docente scansiona il proprio badge, `script.py` determina se si tratta di un'entrata o un'uscita (in base al campo `entrato`) e inserisce un record nella tabella `log`.
3. Il flag `isToUpdate` nella tabella `toupdate` viene impostato a `1`.
4. Il browser controlla ogni secondo se `isToUpdate` è `1` tramite `get_update.php`; in caso affermativo ricarica la tabella chiamando `get_nomi.php` e azzera il flag con `set_updated.php`.

---

## Corsi scolastici

Progetto realizzato per:
- **Sistemi e Reti** — reti, protocolli di comunicazione, architetture client-server
- **TPSIT** (Tecnologie e Progettazione di Sistemi Informatici e di Telecomunicazioni) — sviluppo di sistemi software/hardware integrati
