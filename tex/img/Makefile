all: emoji-dna.pdf emoji-microbe.pdf

clean:
	latexmk -c
	rm -f emoji-*.pdf

fresh: clean all

emoji-dna.pdf: emoji-dna-source.tex
	lualatex emoji-dna-source.tex
	mv emoji-dna-source.pdf emoji-dna.pdf

emoji-microbe.pdf: emoji-microbe-source.tex
	lualatex emoji-microbe-source.tex
	mv emoji-microbe-source.pdf emoji-microbe.pdf

.PHONY: all clean fresh
