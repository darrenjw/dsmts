@model:2.3.1=ImmigrationDeath03 "Immigration-Death (002), variant 03"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
@parameters
 Alpha=10
 Mu=0.1
@reactions
@r=Immigration
 -> X
 Alpha : Alpha=5
@r=Death
 X -> 
 Mu*X
