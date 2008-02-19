@model:2.3.1=ImmigrationDeath02 "Immigration-Death (002), variant 02"
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
 Alpha
@r=Death
 X -> 
 Mu*X
