.PHONY: slides handouts all

all: slides-video handouts

slides-video:
	(cd slidesvideo ; make)
	
slides:
	(cd slides ; make)
	
handouts:
	(cd handouts ; make)


cleanall:
	(cd slidesvideo ; make clean)
	(cd slides ; make clean)
	(cd handouts ; make clean)
	
