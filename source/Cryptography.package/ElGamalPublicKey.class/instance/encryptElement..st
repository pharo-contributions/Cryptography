actions
encryptElement: anInteger
	| k gamma delta |
	k _ SecureRandom picker nextInt: modulo-2.
	gamma _ generator raisedTo: k modulo: modulo.
	delta _ anInteger * (generatorRaisedToA raisedTo: k modulo: modulo) \\ modulo.
	^ Array with: gamma with: delta