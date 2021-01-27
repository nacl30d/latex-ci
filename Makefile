.PHONY: all

CC = latexmk
THESIS_DIR = thesis
THESIS_SRCS = $(shell find $(THESIS_DIR) -name '*.tex')

all: $(foreach x, thesis abstract, $x.pdf)

thesis: $(foreach x ,thesis abstract, $x.pdf)

thesis.pdf: thesis.tex $(THESIS_SRCS)
	$(CC) $<

abstract.pdf: abstract.tex
	$(CC) $<

clean:
	rm -rf *.pdf
