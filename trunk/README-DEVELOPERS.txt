$LastChangedDate$
$Rev$
$Author$

README-DEVELOPERS.txt
---------------------

This readme is for the developers of the test suite - it should not be
included in the released version of the suite.

It is here to provide documentation for the developers (currently:
DJW and CSG).

The current version can be checked out of the SVN repository with a
command like:

svn checkout https://dsmts.googlecode.com/svn/trunk dsmts

The SVN repository contains just the .mod files and the .csv output
files. Other stuff (the SBML and the PDF plots, for example) can be
generated as required, so shouldn't be stored in the repository.

Adding a model:

To add a model, create (however you like) the SBML shorthand for the
model (XXX.mod) and the corresponding output (XXX-mean.csv and
XXX-sd.csv). "svn add" these three files to the repository. Then
include a brief description into the file "dsmts-models.tex" (remember
to include the line that will include the plots), and do a
"make". Check that everything looks OK in "dsmts-userguide.pdf", and that
the SBML file "XXX.xml" also looks OK.

Updating the documentation:

The main part of the user-guide is in the file
"dsmts-userguide.tex". However, the model descriptions are included
from the file "dsmts-models.tex". If you make changes to either file,
"make" is the safest way to re-build everything correctly. However, if
you are making multiple changes, "make dsmts-userguide.pdf" will be
significantly quicker, and should work fine after the first "make".



% eof
