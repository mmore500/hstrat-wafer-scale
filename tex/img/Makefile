all: emoji-dna.pdf emoji-microbe.pdf

clean:
	latexmk -c
	rm -f emoji-*.pdf

fresh: clean all

emoji-dna.pdf: emoji-dna.tex
	lualatex emoji-dna.tex

emoji-microbe.pdf: emoji-microbe.tex
	lualatex emoji-microbe.tex

.PHONY: all clean fresh
