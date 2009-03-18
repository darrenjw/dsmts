@model:2.4.1=ImmigrationDeath01 "Immigration-Death (002), variant 01"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
@parameters
 Alpha=1
 Mu=0.1
@reactions
@r=Immigration
 -> X
 Alpha
@r=Death
 X -> 
 Mu*X
