converting
fromStream: stream withSecurityParams: securityParams

	securityParams isRSAKeyExchangeAlgorithm
		ifTrue: [self exchangeKeys: (SSL30EncryptedPreMasterSecret new fromStream: stream)].
	(securityParams isAnyDHKeyExchangeAlgorithm 
		and: [securityParams isExplicitKeyExchange])
			ifTrue: [self exchangeKeys: (ClientDiffieHellmanPublic new fromStream: stream)].
