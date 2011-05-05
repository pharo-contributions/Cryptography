as yet unclassified
stream2word: someData 


|temp j dataBytes |
temp:=0.

dataBytes := someData size.

1 to: 4 do:  [ :each | 
		temp:=(temp bitShift: 8 ) bitOr: ((someData at: current) bitAnd: 16rFF).

	current := (current \\ dataBytes) +1.

	   ].


^temp.
