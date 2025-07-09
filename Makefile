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