instance creation
createFrom: anAssociation
	^self new
		cipherID: anAssociation key;
		cipherSuiteSymbol: anAssociation value;
		cipherSuite: (self cipherSuiteFromSymbol: anAssociation value);
		keyExchange: (self keyExchangeFromSymbol: anAssociation value);
		hashAlgorithm: (self hashAlgorithmFromSymbol: anAssociation value);
		yourself.