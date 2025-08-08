# Makefile per compilazione tesi
.PHONY: all clean quick full view

# Target principale
all: full

# Compilazione rapida (solo pdflatex)
quick:
	pdflatex -interaction=nonstopmode main.tex

# Compilazione completa con bibliografia e indice
full:
	pdflatex main.tex
	biber main
	pdflatex main.tex
	pdflatex main.tex
	@echo "Pulizia file temporanei..."
	@make clean-temp

# Compilazione completa con nome file contenente la data
full-version:
	DATE=$(shell date +%d_%m_%Y) && \
	pdflatex main.tex && \
	biber main && \
	pdflatex main.tex && \
	pdflatex main.tex && \
	mv main.pdf "Tesi_Domotica_Residenziale_di_Michele_Rota_Biasetti_$${DATE}.pdf" && \
	make clean-temp

# Usa latexmk (più intelligente)
auto:
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make main.tex

# Pulisci solo file temporanei (non PDF)
clean-temp:
	@find . -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" \
		-o -name "*.toc" -o -name "*.lof" -o -name "*.lot" \
		-o -name "*.bbl" -o -name "*.blg" -o -name "*.bcf" \
		-o -name "*.run.xml" -o -name "*.fdb_latexmk" \
		-o -name "*.fls" -o -name "*.synctex.gz" \
		-o -name "*~" -o -name "*.backup" \) -delete
	@echo "File temporanei eliminati!"

# Pulisci file temporanei
clean: clean-temp

# Pulisci tutto (incluso PDF)
cleanall: clean
	rm -f main.pdf

# Apri il PDF
view:
	open main.pdf

# Mostra l'elenco dei comandi
help:
	@echo "Comandi disponibili:"
	@echo "  make all           - Compila la tesi (full)"
	@echo "  make quick         - Compilazione rapida senza bibliografia"
	@echo "  make full          - Compilazione completa con bibliografia e indice"
	@echo "  make full-version  - Compilazione completa e PDF con data nel nome"
	@echo "  make auto          - Compilazione automatica con latexmk"
	@echo "  make clean-temp    - Elimina file temporanei"
	@echo "  make clean         - Elimina file temporanei"
	@echo "  make cleanall      - Elimina anche il PDF generato"
	@echo "  make view          - Apre il PDF generato"
	@echo "  make help          - Mostra questo aiuto"