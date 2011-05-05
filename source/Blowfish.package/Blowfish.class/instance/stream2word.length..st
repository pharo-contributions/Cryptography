as yet unclassified
stream2word: someData length: someBytes


|temp j  |
temp:=0.



1 to: 4 do:  [ :each | 
		temp:=(temp bitShift: 8 ) bitOr: ((someData atWrap: current) bitAnd: 16rFF).

	current := (current \\ someBytes) +1.

	   ].


^temp.
