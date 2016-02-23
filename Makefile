.PHONY: slides handouts notes all

all: slides handouts notes

notes:
	latexmk -bibtex -pdflatex="pdflatex --shell-escape --synctex=1 %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \slidesfalse \handoutsfalse \notestrue\input{%S}'" -outdir=./notes -pdf
	
slides:
	latexmk -pdflatex="pdflatex --shell-escape --synctex=1 %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \notesfalse \handoutsfalse \slidestrue\input{%S}'" -outdir=slides -pdf
	
handouts:
	latexmk -pdflatex="pdflatex --shell-escape --synctex=1 %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \slidesfalse \notesfalse \handoutstrue\input{%S}'" -outdir=./handouts -pdf



cleanall:
	latexmk -CA -outdir=handouts
	latexmk -CA -outdir=slides
	latexmk -CA -outdir=notes
	
