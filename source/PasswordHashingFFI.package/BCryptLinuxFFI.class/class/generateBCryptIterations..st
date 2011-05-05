as yet unclassified
generateBCryptIterations: anInteger
	| max min num |
	max := 31.
	min := 4.
	num := anInteger <= min
		ifTrue: [ min ]
		ifFalse: [
			anInteger >= max
				ifTrue: [ max ]
				ifFalse: [ anInteger ] ].
			
	^num<10 ifTrue:['0' , num greaseString ] ifFalse:[num greaseString]