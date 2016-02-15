odgfiles := $(patsubst %.odg,%.pdf,$(wildcard */*.odg))

pdf: $(odgfiles)
	rm -f openoffice.lock
	killall -9 soffice; true

openoffice.lock:
	touch openoffice.lock
	/Applications/OpenOffice.org.app/Contents/MacOS/soffice -invisible -accept="socket,port=8100;urp;" &
	sleep 10


%.pdf : %.odg 
	make -f Makefile openoffice.lock 
	java -jar /opt/jodconverter-2.2.1/lib/jodconverter-cli-2.2.1.jar $< $@

clean:
	rm *.pdf 
 
