#!/bin/csh

rm -f model-list
touch model-list
foreach name (*.mod)
 ./mod2sbml.py $name > ${name:r}.xml
 echo ${name:r} >> model-list
end


