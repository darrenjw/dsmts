@model:2.3.1=ImmigrationDeath08 "Immigration-Death (002), variant 08"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
@parameters
 k=2
@reactions
@r=Immigration
 -> X
 k : k=1
@r=Death
 X -> 
 k*X : k=0.1
