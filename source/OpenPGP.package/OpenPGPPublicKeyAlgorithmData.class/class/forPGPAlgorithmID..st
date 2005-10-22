instance creation
forPGPAlgorithmID: anInteger
	(anInteger between: 1 and: 3) ifTrue: [^OpenPGPRSAData new].
	anInteger = 16 ifTrue: [^OpenPGPElgamalData new].
	anInteger = 17 ifTrue: [^OpenPGPDSAData new].
	anInteger = 20 ifTrue: [^OpenPGPElgamalData new].
	self error: 'PGP algorithm ', anInteger printString, ' is not yet supported'