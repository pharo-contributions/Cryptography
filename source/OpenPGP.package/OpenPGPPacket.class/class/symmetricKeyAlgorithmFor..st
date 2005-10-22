accessing
symmetricKeyAlgorithmFor: anInteger
	anInteger = 2 ifTrue: [^TripleDESForOpenPGP new].
	anInteger = 3 ifTrue: [^CAST5 new].
	self error: 'symmetric key algorithm ', anInteger printString, ' not yet available'