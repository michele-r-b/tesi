# 📚 Tesi di Laurea - [Domotica Residenziale]

> Repository LaTeX per la tesi di laurea in Ingegneria Informatica

## 📋 Indice

- [Descrizione](#descrizione)
- [Struttura del Repository](#struttura-del-repository)
- [Prerequisiti](#prerequisiti)
- [Installazione](#installazione)
- [Utilizzo](#utilizzo)
- [Workflow di Sviluppo](#workflow-di-sviluppo)
- [GitHub Actions](#github-actions)
- [Contribuire](#contribuire)

## 📝 Descrizione

Questo repository contiene il codice sorgente LaTeX della mia tesi di laurea dal titolo:

**"Domotica Residenziale"**

- **Autore**: Michele R.B.
- **Anno Accademico**: 2024/2025


### Abstract

[Inserisci un breve abstract della tesi - max 200 parole]

## 📁 Struttura del Repository

```
.
├── capitoli/              # Capitoli della tesi
│   ├── cap1.tex          # Introduzione
│   ├── cap2.tex          # Stato dell'arte
│   ├── cap3.tex          # [Titolo capitolo]
│   └── ...
├── immagini/             # Figure e immagini
├── .github/              
│   └── workflows/        # GitHub Actions per build automatica
├── main.tex              # File principale LaTeX
├── bibliography.bib      # Bibliografia in formato BibTeX
├── glossario.tex         # Glossario dei termini
├── appendice.tex         # Appendici
├── Makefile             # Automazione compilazione
└── README.md            # Questo file
```

## 🛠 Prerequisiti

### macOS

1. **LaTeX Distribution**: BasicTeX o MacTeX
   ```bash
   # Con Homebrew
   brew install --cask basictex
   
   # Pacchetti essenziali
   sudo tlmgr update --self
   sudo tlmgr install latexmk biber
   ```

2. **Editor**: Visual Studio Code con estensioni
   - LaTeX Workshop
   - LTeX (spell checker)
   - Git Graph

### Windows/Linux

- **Windows**: MiKTeX o TeX Live
- **Linux**: `sudo apt-get install texlive-full`

## 🚀 Installazione

1. **Clona il repository**
   ```bash
   git clone https://github.com/michele-r-b/tesi.git
   cd tesi
   ```

2. **Installa i pacchetti LaTeX necessari**
   ```bash
   # Installa collezioni complete (consigliato)
   sudo tlmgr install collection-latexextra
   sudo tlmgr install collection-bibtexextra
   sudo tlmgr install collection-publishers
   ```

3. **Configura VSCode** (opzionale)
   ```bash
   code .  # Apri in VSCode
   ```
   Le configurazioni sono già presenti in `.vscode/`

## 📖 Utilizzo

### Compilazione con Make

```bash
# Compilazione completa (con bibliografia)
make full

# Compilazione veloce (solo pdflatex)
make quick

# Pulizia file temporanei
make clean

# Visualizza PDF
make view
```

### Compilazione manuale

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### In Visual Studio Code

1. Apri il progetto: `code .`
2. Modifica un file `.tex`
3. Salva con `Cmd+S` (macOS) o `Ctrl+S` (Windows/Linux)
4. La compilazione parte automaticamente
5. Visualizza il PDF con `Cmd+Option+V`

## 🔄 Workflow di Sviluppo

### Branch

- `main`: Versione stabile della tesi
- `develop`: Sviluppo attivo
- `feature/*`: Nuovi capitoli o sezioni
- `fix/*`: Correzioni

### Workflow consigliato

1. Crea un nuovo branch per ogni capitolo/sezione
   ```bash
   git checkout -b feature/capitolo-metodologia
   ```

2. Lavora sul capitolo
   ```bash
   # Modifica, compila, verifica
   make full
   ```

3. Commit delle modifiche
   ```bash
   git add capitoli/cap3.tex
   git commit -m "Aggiunge sezione metodologia sperimentale"
   ```

4. Push e Pull Request
   ```bash
   git push origin feature/capitolo-metodologia
   ```

## 🤖 GitHub Actions

Il repository include una GitHub Action che:
- Si attiva ad ogni push su `main`
- Compila automaticamente il PDF
- Salva il PDF come artifact scaricabile

Per disabilitare: modifica `.github/workflows/build.yml`

## 📚 Bibliografia

Le citazioni bibliografiche sono gestite con BibLaTeX/Biber. 

Per aggiungere una nuova fonte:
1. Aggiungi l'entry in `bibliography.bib`
2. Cita nel testo con `\cite{chiave}`
3. Ricompila con `make full`

### Esempio entry BibTeX

```bibtex
@article{esempio2024,
  author = {Cognome, Nome},
  title = {Titolo dell'articolo},
  journal = {Nome della rivista},
  year = {2024},
  volume = {1},
  pages = {1--10}
}
```

## 🤝 Contribuire

Anche se questa è una tesi personale, accetto suggerimenti e correzioni:

1. Apri una [Issue](https://github.com/michele-r-b/tesi/issues) per segnalare errori
2. Per correzioni minori, apri una Pull Request

## 📄 Licenza

Copyright © 2025 Michele R.B. Tutti i diritti riservati.

Il contenuto di questa tesi è protetto da copyright. Per utilizzi o citazioni, contattare l'autore.

---

**Ultimo aggiornamento**: Luglio 2025
