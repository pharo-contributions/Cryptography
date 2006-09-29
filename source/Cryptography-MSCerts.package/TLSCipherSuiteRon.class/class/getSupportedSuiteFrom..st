services
getSupportedSuiteFrom: aClientHello
	| supportedSuites aSuite aByteArray suites hexString |
	aByteArray := aClientHello cipherSuites.
	hexString _ aByteArray hex.
	suites := self parseVersion: aClientHello helloVersion suitesFromHex: hexString.
	supportedSuites _ self supportedSuites.
	suites do: [:suiteHex | 
		aSuite _ supportedSuites at: suiteHex ifAbsent: nil.
		aSuite ifNotNil: [^self createFrom: suiteHex->aSuite].
	].
	^nil.