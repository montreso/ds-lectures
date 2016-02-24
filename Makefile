.PHONY: slides handouts notes all

notefiles := $(shell fgrep -l "\\note" *.tex)


all: slides handouts notes

notes:
	mkdir -p notes
	echo $(notefiles)
	latexmk -logfilewarninglist -bibtex- -pdflatex="pdflatex --shell-escape %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \slidesfalse \handoutsfalse \notestrue\input{%S}'" -outdir=./notes -pdf $(notefiles)
	
slides:
	mkdir -p slides
	latexmk -logfilewarninglist -pdflatex="pdflatex --shell-escape %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \notesfalse \handoutsfalse \slidestrue\input{%S}'" -outdir=slides -pdf
	
handouts:
	mkdir -p handouts
	latexmk -logfilewarninglist -pdflatex="pdflatex --shell-escape %O '\newif \ifnotes \newif \ifslides \newif \ifhandouts \slidesfalse \notesfalse \handoutstrue\input{%S}'" -outdir=./handouts -pdf

clean-slides:
	(cd slides ; rm -f *.pdf *.log *.aux *.fdb_latexmk *.fls *.nav *.bbl *.blg *.out *.toc *.snm *.synctex.gz *.vrb)
	
clean-handouts:
	(cd handouts ; rm -f *.pdf *.log *.aux *.fdb_latexmk *.fls *.nav *.bbl *.blg *.out *.toc *.snm *.synctex.gz *.vrb)

clean-notes:
	(cd notes ; rm -f *.pdf *.log *.aux *.fdb_latexmk *.fls *.nav *.bbl *.blg *.out *.toc *.snm *.synctex.gz *.vrb)
	
cleanall: clean-slides clean-handouts clean-notes
	
