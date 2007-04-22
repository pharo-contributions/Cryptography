queries
requiresServerKeyExchange

	self cipherSuite requiresServerCertificate not
		ifTrue: [^ true].
	self isDHEKeyExchangeAlgorithm
		ifTrue: [^true].
	^ false