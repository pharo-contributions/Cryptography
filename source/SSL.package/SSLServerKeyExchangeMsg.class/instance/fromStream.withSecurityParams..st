converting
fromStream: stream withSecurityParams: securityParams

	securityParams isAnyDHKeyExchangeAlgorithm
		ifTrue: [self serverParams: (ServerDHParams new fromStream: stream)].
	securityParams isRSAKeyExchangeAlgorithm
		ifTrue: [self serverParams: (ServerRSAParams new fromStream: stream)].
	self signature: stream upToEnd.
