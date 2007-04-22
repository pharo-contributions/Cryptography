queries
isExplicitKeyExchange

	^ self isAnyDHKeyExchangeAlgorithm and: [self requiresClientCertificate not]