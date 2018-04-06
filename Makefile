.SUFFIXES: .md .html .pdf .docx

%.pdf: %.md; pandoc -o $@ $< --number-sections -H header.tex

%.html: %.md template.html; pandoc -t html5 -o $@ $< --template=template.html --number-sections 

%.docx: %.md; pandoc -o $@ $< --smart --number-sections

default: P1017.pdf

all: P1017.pdf P1017.html P1017.docx
