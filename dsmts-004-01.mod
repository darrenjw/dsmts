@model:2.3.1=BatchImmigrationDeath01 "Batch Immigration-Death (004), variant 01"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
@parameters
 Alpha=1
 Mu=0.2
@reactions
@r=Immigration
 -> 5X
 Alpha
@r=Death
 X -> 
 Mu*X
