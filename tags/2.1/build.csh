#!/bin/csh
#$LastChangedDate: 2006-04-17 09:17:19 +0100 (Mon, 17 Apr 2006) $
#$Rev: 42 $
#$Author: colin $



rm -f model-list
touch model-list
foreach name (*.mod)
 ./mod2sbml.py $name > ${name:r}.xml
 echo ${name:r} >> model-list
end


