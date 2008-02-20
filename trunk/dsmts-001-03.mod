@model:2.3.1=BirthDeath03 "Birth-death model (001), variant 03"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=100 s
@parameters
 Lambda=1
 Mu=1.1
@reactions
@r=Birth
 X ->  2X
 Lambda*X
@r=Death
 X -> 
 Mu*X
