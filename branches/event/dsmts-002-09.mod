@model:2.1.1=ImmigrationDeath01 "Immigration-Death (002), variant 09"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
 Cell:Y=0 s
 Cell:Z=0 s
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
@events
 reset1= and(t=5,Y=0): Y=1,Z=1
 reset2= and(Z=1,t=10): Z=0
