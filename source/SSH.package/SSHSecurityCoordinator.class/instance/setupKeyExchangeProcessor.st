key exchange
setupKeyExchangeProcessor

	| keyExchangeAlgorithm |
	keyExchangeAlgorithm := self securityParams clientKeyInit keyExchangeAlgorithms
		detect: [:eachAlgorithm | self securityParams serverKeyInit keyExchangeAlgorithms includes: eachAlgorithm]
		ifNone: [self error: 'no key exchange algorithm found'].
	keyExchangeAlgorithm = 'diffie-hellman-group1-sha1'
		ifTrue: [self keyExchangeProcessor: SSHDHGroup1KeyExchangeProcessor new].
