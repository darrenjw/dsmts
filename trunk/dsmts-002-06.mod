@model:2.3.1=ImmigrationDeath06 "Immigration-Death (002), variant 06"
@units
 substance=item
@compartments
 Cell
@species
 Cell:X=0 s
 Cell:Source=0 sb
 Cell:Sink=0 s
@parameters
 Alpha=10
 Mu=0.1
@reactions
@r=Immigration
 Source -> X
 Alpha
@r=Death
 X -> Sink
 Mu*X
