.SUFFIXES: .md .html .pdf .docx .yaml

PANDOC_FLAGS = -f markdown --variable urlcolor=cyan

CITEPROC= --filter pandoc-citeproc --csl=acm-sig-proceedings-long-author-list.csl

%.pdf: %.md; pandoc -o $@ $< --number-sections -H header.tex

%.html: %.md %_metadata.yaml template.html; pandoc $(PANDOC_FLAGS) $(CITEPROC) -t html5 -o $@ $< --template=template.html

%.docx: %.md; pandoc -o $@ $< --smart --number-sections

default: P1017.pdf

all: P1017.pdf P1017.html P1017.docx
