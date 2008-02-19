# Makefile

FILE=paper

FORCE:
	make $(FILE).dvi

update:
	cd .. ; svn update

commit:
	cd .. ; svn commit

$(FILE).ps: $(FILE).dvi
	dvips $(FILE)

$(FILE).dvi: $(FILE).tex refs.bib
	latex $(FILE)
	bibtex $(FILE)
	latex $(FILE)
	latex $(FILE)

$(FILE).pdf: $(FILE).ps
	ps2pdf $(FILE).ps $(FILE).pdf

$(FILE)-2.ps: $(FILE).ps
	psnup -2 -pa4 $(FILE).ps > $(FILE)-2.ps
	
print: $(FILE)-2.ps
	lpr $(FILE)-2.ps

view: $(FILE).ps
	gv $(FILE).ps	
	

clean:
	rm -f *~ *.dvi *.log *.blg $(FILE).pdf $(FILE).ps $(FILE)-2.ps

full-clean:
	make clean
	rm -f *.aux *.bbl

# eof

