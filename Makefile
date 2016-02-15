.PHONY: slides handouts all

slides-video:
	(cd slidesvideo ; make)
	
slides:
	(cd slides ; make)
	
handouts:
	(cd handouts ; make)

all: slides slides-video handouts

cleanall:
	(cd slidesvideo ; make clean)
	(cd slides ; make clean)
	(cd handouts ; make clean)
	