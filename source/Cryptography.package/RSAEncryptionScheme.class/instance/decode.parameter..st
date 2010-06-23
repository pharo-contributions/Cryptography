OAEP encoder
decode: em parameter: parameter
	| emLen maskedSeed maskedDB seedMask seed dbMask dataBlock dbLen pHash pHashPrima i terminado b |
	parameter size > (2 raisedTo: 60) ifTrue: [self error: 'decoding error'].
	emLen _ em size.
	emLen < (2 * hashLen + 1) ifTrue: [self error: 'decoding error'].

	maskedSeed _ em copyFrom: 1 to: hashLen.
	maskedDB _ em copyFrom: (hashLen + 1) to: emLen.
	seedMask _ self maskOfLength: hashLen fromString: maskedDB.
	seed _ maskedSeed bitXor: seedMask.
	dbMask _ self maskOfLength: (emLen - hashLen) fromString: seed.
	dataBlock _ maskedDB bitXor: dbMask.
	dbLen _ dataBlock size.

	pHash _ (hash hashMessage: parameter) asByteArrayOfSize: hashLen.
	pHashPrima _ dataBlock copyFrom: 1 to: hashLen.
	i _ hashLen + 1.
	terminado _ false.
	[terminado] whileFalse: 
		[b _ dataBlock at: i.
		b=0 ifTrue: 
			[i _ i+1.
			i > dbLen ifTrue: [self error: 'decoding error']]
		ifFalse: 
			[b=1 
				ifTrue: [terminado _ true]
				ifFalse: [self error: 'decoding error']
			]
		].
	pHash = pHashPrima ifFalse: [self error: 'decoding error'].
	^ dataBlock copyFrom: i+1 to: dbLen