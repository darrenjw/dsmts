# Makefile

FORCE:
	make clean
	make sbml
	make plots
	make dsmts-userguide.pdf
	make dsmts.zip

dsmts.zip: dsmts-userguide.pdf
	zip dsmts.zip README.txt model-list dsmts-userguide.pdf *.mod *.xml *.csv dsmts-???-??-*.pdf

sbml:
	./build.csh

plots:
	R CMD BATCH genplots.R

dsmts-userguide.pdf: dsmts-userguide.tex dsmts-models.tex
	pdflatex dsmts-userguide

run:
	R CMD BATCH test-gillespie2.R

update:
	svn update

commit:
	svn commit

clean:
	rm -f *.xml model-list *~ dsmts.zip dsmts-*.pdf *.out *Rout *.log *.aux





# eof

