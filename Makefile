HOME=/home/gustaf/gemsite
BIN=/home/gustaf/bin
GEM=/home/gemini/gemini
CGI=$(HOME)/cgi-bin

.PHONY: main-page
main-page: $(HOME)/gemini-main/*.gmi $(HOME)/gemini-main/favicon.txt 
	cp $(HOME)/gemini-main/*.gmi $(GEM)/
	cp $(HOME)/gemini-main/favicon.txt $(GEM)/

.PHONY: blog
blog:
	perl $(BIN)/gemlog.cgi -password='password'

.PHONY: all
all:
	perl $(BIN)/gemlog.cgi -password='password' -all=1

.PHONY: times
times:
	perl $(BIN)/gemlog.cgi -password='password' -all=1 -quiet=1
	perl $(HOME)/touch-files-from-cache-data.pl
	perl $(BIN)/gemlog.cgi -password='password' -all=1 -quiet=1

.PHONY: cgi
cgi: $(CGI)/* $(CGI)/templates/* $(CGI)/lib/*
	cp -r $(CGI)/* $(GEM)/cgi-bin/
	cp $(CGI)/templates/*.tt $(GEM)/cgi-bin/templates/
	cp $(CGI)/lib/*.pm $(GEM)/cgi-bin/lib/
